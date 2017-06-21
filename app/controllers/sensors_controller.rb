class SensorsController < ApplicationController

  require "dht-sensor-ffi"

  def temp
    render json: DhtSensor.read(ENV["dht_pin"].to_i, ENV["dht_type"].to_i).temp
  end

  def humidity
    render json: DhtSensor.read(ENV["dht_pin"].to_i, ENV["dht_type"].to_i).humidity
  end
end
