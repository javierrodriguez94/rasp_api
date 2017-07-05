class FirebaseController < ApplicationController

  require 'fcm'

  def send_notification
    fcm = FCM.new(ENV["firebase_key"])
    registration_ids= Firebase.all.map{ |f| f.token } # an array of one or more client registration tokens
    puts registration_ids
    options = {data: {message: "123"}}
    response = fcm.send(registration_ids, options)
    render json: response
  end

  def save_token
    if Firebase.where(token: params[:firebase_token]).count == 0
      firebase = Firebase.new
      firebase.token = params[:firebase_token]
      firebase.save!
    end
    render json: "Ok"
  end
end
