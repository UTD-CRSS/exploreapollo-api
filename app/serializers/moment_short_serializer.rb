class MomentShortSerializer < ActiveModel::Serializer
  attributes :id, :description, :title
  attribute :met_start, key: :metStart
  attribute :met_end, key: :metEnd
  attribute :friendly_id, key: :name
end
