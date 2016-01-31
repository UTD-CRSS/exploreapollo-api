class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :title
  attribute :friendly_id, key: :slug
end
