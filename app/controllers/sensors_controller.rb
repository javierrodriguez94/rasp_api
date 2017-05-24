class SensorsController < ApplicationController

  require "dht-sensor-ffi"

  def temp
    render json: DhtSensor.read(ENV["DHT_PIN"], ENV["DTH_TYPE"]).temp
  end

  def humidity
    render json: DhtSensor.read(ENV["DHT_PIN"], ENV["DTH_TYPE"]).humidity
  end
end
