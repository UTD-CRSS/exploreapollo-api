class ApplicationController < ActionController::API
  include ActionController::Serialization

  def default_serializer_options
    {root: false}
  end

private
  def handle_slugs obj
    # Clear slug here to force regeration
    obj.slug = nil

    # Translate slugs to id for associations
    collection = [
      "channel",
      "story",
      "moment",
      "channel_chunk"
    ]
    collection.each do |c|
      key = "#{c}_ids"
      next unless params.key? key
      ids = []
      # Resolve with friendly
      params[key].each do |c_id|
        claz = c.camelcase.constantize
        a = claz.friendly.find(c_id)
        ids << a.id unless a.nil?
      end
      obj.send "#{key}=".to_sym, ids
    end
  end
end
