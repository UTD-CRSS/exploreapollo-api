class StoryItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :title
  attribute :friendly_id, key: :name

  attribute :moments, key: :momentList
end
