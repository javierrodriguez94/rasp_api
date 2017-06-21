Rails.application.routes.draw do
  #constraints(ip: /192\.\d+\.\d+\.\d+/) do
  resources :users
  #resources :lights
  #resources :sensors
  #resources :camera
  #resources :tasks
  #end

  controller :lights do
    get "/lights/on" => :on
    get "/lights/off" => :off
    get "/lights/state" => :state
  end

  controller :camera do
    get "/camera" => :photo
  end

  controller :tasks do
    get "/tasks/cpu" => :cpu
    get "/tasks/disk" => :disk
    get "/tasks/ram" => :ram
    get "tasks/temp" => :temp
  end

  controller :sensors do
    get "sensors/temp" => :temp
    get "sensors/humidity" => :humidity
  end


  #get "/get_ram_info",  to: "tasks#get_ram_info"
  #get "/get_temp",  to: "tasks#get_temp"
  #get "/gpio/:pin",  to: "tasks#gpio"
  #get "/image",  to: "tasks#image"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
