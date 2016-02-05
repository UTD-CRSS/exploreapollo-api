class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate, except: [:index, :show]

  def default_serializer_options
    {root: false}
  end

private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      token.eql?(Rails.application.config_for(:explore_app)["backend_api_key"])
    end
  end
end
