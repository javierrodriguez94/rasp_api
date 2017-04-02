class LightsController < ApplicationController

  def light_on
    gpio ENV["LIGHT_PIN"], 0
  end

  def light_off
    gpio ENV["LIGHT_PIN"], 1
  end

  def light_state
    render json: gpio(ENV["LIGHT_PIN"], nil)
  end


  private

  def gpio pin, value
    raise("GPIO Error - Invalid pin #{pin}\n") if pin > 40 or pin < 0
    RPi::GPIO.set_numbering :board
    RPi::GPIO.setup pin, :as => :output
    if value.to_s == "0"
      RPi::GPIO.set_low pin
    elsif value.to_s == "1"
      RPi::GPIO.set_hight pin
    elsif value == nil
      RPi::GPIO.setup pin, :as => :input
      return Rpi::GPIO.low? pin ? 0 : 1
    else
      raise("Error invalid value")
    end
    return nil
  end

end
