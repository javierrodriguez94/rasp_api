class ApplicationController < ActionController::API

  before_action :validate_token

  def validate_token
    unless User.where(token: 1).any?#params[:token]).any?
      head(403)
    end
  end

end
