class TasksController < ApplicationController

  def get_temp
    tmp = get_cpu_temperature
    render json: tmp
  end
  def get_ram_info
    info = %x{free}.lines.to_a[1].split[1,3]
    render json: info
  end

  def gpio
    RPi::GPIO.set_numbering :board
    RPi::GPIO.setup 2, :as => :input
    debugger
    pin = RPi::GPIO.high? PIN_NUM
    render json: pin.value
  end







  private

  def get_cpu_temperature
    debugger
    %x{optvcgencmd measure_temp}.lines.first.sub(/temp=/, '').sub(/C\n/, '')
  end

  def get_cpu_use
    %x{top -n1}.lines.find{ |line| /Cpu\(s\):/.match(line) }.split[1]
  end

  def get_disk_Space
    %x{df -h /}.lines.to_a[1].split[1,4]
  end
end