require 'rpi_gpio'
require "dht-sensor-ffi"

class TasksController < ApplicationController

  def temp
    puts DhtSensor.read(21, 11)
    render json: "ok"#val.temp+" "+val.humidity
    #render json: get_cpu_temperature
  end

  def cpu
    render json: get_cpu_use
  end

  def disk
    render json: get_disk_space
  end

  def ram
    info = %x{free}.lines.to_a[1].split[1,3]
    render json: info
  end



  private


  def get_cpu_temperature
    %x{"/opt/vc/bin/vcgencmd measure_temp"}.lines.first.sub(/temp=/, '').sub(/C\n/, '')
  end

  def get_cpu_use
    %x{"top -n1"}.lines.find{ |line| /Cpu\(s\):/.match(line) }.split[1]
  end

  def get_disk_space
    %x{"df -h /"}.lines.to_a[1].split[1,4]
  end

end
