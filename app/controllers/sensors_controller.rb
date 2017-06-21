class SensorsController < ApplicationController

  require "dht-sensor-ffi"

  def temp
    pin = ENV["DHT_PIN"].to_i
    type = ENV["DTH_TYPE"].to_i
    render json: DhtSensor.read(pin, type ).temp
  end

  def humidity
    pin = ENV["DHT_PIN"].to_i
    type = ENV["DTH_TYPE"].to_i
    render json: DhtSensor.read(pin, type).humidity
  end
end
