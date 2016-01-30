class StoryItemSerializer < ActiveModel::Serializer
  attributes :id , :created , :description, :name, :title

  attribute :moments, key: :momentList
end
