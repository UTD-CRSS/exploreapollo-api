class StoryItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :title
  attribute :slug, key: :name

  attribute :moments, key: :momentList
end
