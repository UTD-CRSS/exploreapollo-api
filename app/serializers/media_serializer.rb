class MediaSerializer < ActiveModel::Serializer
  attributes :id, :url, :title, :slug, :description, :alt_text, :caption
end
