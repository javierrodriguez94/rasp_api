class LightsController < ApplicationController

  def on
    gpio ENV["LIGHT_PIN"], 0
    render json: "ok"
  end

  def off
    gpio ENV["LIGHT_PIN"], 1
    render json: "ok"
  end

  def state
    render json: gpio(ENV["LIGHT_PIN"], nil)
  end


  private

  def gpio pin, value
    pin = pin.to_i
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
