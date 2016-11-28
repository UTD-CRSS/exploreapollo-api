class StoryItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :title
  attribute :friendly_id, key: :name

  attribute :met_start, key: :met_start
  attribute :met_end, key: :met_end

  attribute :moments, key: :momentList
end
