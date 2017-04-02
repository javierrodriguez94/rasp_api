Rails.application.routes.draw do
  #constraints(ip: /192\.\d+\.\d+\.\d+/) do
    resources :users
    resources :lights
    resources :sensors
    resources :camera
    resources :tasks
  #end

  #get "/get_ram_info",  to: "tasks#get_ram_info"
  #get "/get_temp",  to: "tasks#get_temp"
  #get "/gpio/:pin",  to: "tasks#gpio"
  #get "/image",  to: "tasks#image"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
