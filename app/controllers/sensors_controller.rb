class SensorsController < ApplicationController

  require "dht-sensor-ffi"

  def temp
    render json: DhtSensor.read(ENV["DHT_PIN"].to_i, ENV["DTH_TYPE"].to_i).temp
  end

  def humidity
    render json: DhtSensor.read(ENV["DHT_PIN"].to_i, ENV["DTH_TYPE"].to_i).humidity
  end
end
