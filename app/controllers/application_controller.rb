class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate, except: [:index, :show, :random, :search]

  def default_serializer_options
    {root: false}
  end

private

  def authenticate
    authenticate_token || render_unauthorized
  end
  
  def authenticate_token
    authenticate_with_http_token do |token, options|
      token.eql?(Rails.application.config_for(:explore_app)["backend_api_key"])
    end
  end
  
  def render_unauthorized
    render json: 'Bad credentials', status: :unauthorized
  end
  
end
