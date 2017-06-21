class SensorsController < ApplicationController

  require "dht-sensor-ffi"
  pin = ENV["DHT_PIN"].to_i
  type = ENV["DTH_TYPE"].to_i
  def temp
    render json: DhtSensor.read(pin, type ).temp
  end

  def humidity
    render json: DhtSensor.read(pin, type).humidity
  end
end
