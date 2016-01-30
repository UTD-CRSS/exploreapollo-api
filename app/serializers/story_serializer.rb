class StorySerializer < ActiveModel::Serializer
  attributes :id, :description, :title
  attribute :slug, key: :name
end
