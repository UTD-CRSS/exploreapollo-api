class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :authenticate, except: [:index, :show]

  def default_serializer_options
    {root: false}
  end

  private

  def authenticate
    authenticate_api || respond_unauthorized
  end

  def authenticate_api
    authenticate_with_http_token do |token, options|
      token.eql?(Rails.application.config_for(:explore_app)["backend_api_key"])
    end
  end
  def respond_unauthorized
    render json: { errors:["Invalid credentials"] }, status: :unauthorized
  end
end
