class MissionSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :title
  attribute :friendly_id, key: :name
end
