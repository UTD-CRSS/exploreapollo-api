class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :photo_url
  attribute :friendly_id, key: :slug
end
