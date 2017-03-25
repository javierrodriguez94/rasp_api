require 'rpi_gpio'

class TasksController < ApplicationController

  def get_temp
    tmp = 23 #get_cpu_temperature
    render json: tmp
  end
  def get_ram_info
    info = %x{free}.lines.to_a[1].split[1,3]
    render json: info
  end

  def gpio
    p = params[:pin]
    RPi::GPIO.set_numbering :bcm
    RPi::GPIO.setup p, :as => :input
    pin = RPi::GPIO.high? p
    render json: pin
  end

  def image
    system "fswebcam -p YUYV -r 1280x720 imagen.jpg"
    render json: "ok"
  end







  private

  def get_cpu_temperature
    debugger
    %x{/opt/vc/bin/vcgencmd measure_temp}.lines.first.sub(/temp=/, '').sub(/C\n/, '')
  end

  def get_cpu_use
    %x{top -n1}.lines.find{ |line| /Cpu\(s\):/.match(line) }.split[1]
  end

  def get_disk_Space
    %x{df -h /}.lines.to_a[1].split[1,4]
  end
end
