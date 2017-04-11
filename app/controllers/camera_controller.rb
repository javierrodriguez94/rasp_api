class CameraController < ApplicationController

  def photo
    system "fswebcam -p #{ENV["CAMERA_PALETE"]} -r #{ENV["CAMERA_RESOLUTION"]} --no-banner #{ENV["CAMERA_DIR"]}"
    send_file ENV["CAMERA_DIR"], type: 'image/jpg', disposition: 'inline'
  end

end
