class ApplicationController < ActionController::API

  before_action :validate_token

  def validate_token
    Rails.logger.debug request.remote_ip
    unless User.where(token: params[:token]).any?
      head(403)
    end
  end

end
