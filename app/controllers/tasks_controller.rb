require 'rpi_gpio'

class TasksController < ApplicationController

  def cpu_temp
    render json: get_cpu_temperature
  end

  def cpu
    render json: get_cpu_use
  end

  def disk
    render json: get_disk_space
  end

  def ram_info
    info = %x{free}.lines.to_a[1].split[1,3]
    render json: info
  end



  private


  def get_cpu_temperature
    system("/opt/vc/bin/vcgencmd measure_temp").lines.first.sub(/temp=/, '').sub(/C\n/, '')
  end

  def get_cpu_use
    system("top -n1").lines.find{ |line| /Cpu\(s\):/.match(line) }.split[1]
  end

  def get_disk_space
    system("df -h /").lines.to_a[1].split[1,4]
  end

end
