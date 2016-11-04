class MediaSerializer < ActiveModel::Serializer
  attributes :id, :url, :title, :slug, :description, :alt_text, :caption

  attribute :url do
  	object.url.url if object.type == "Image"
  end
end
