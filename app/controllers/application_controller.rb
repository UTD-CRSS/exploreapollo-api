class ApplicationController < ActionController::API
  include ActionController::Serialization

  def default_serializer_options
    {root: false}
  end
end
