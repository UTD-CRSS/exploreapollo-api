class MissionSerializer < ActiveModel::Serializer
  attributes :id, :title
  attribute :friendly_id, key: :name
  attribute :start_time, key: :start_date
  attribute :unix_start_time, key: :start_time

  def unix_start_time
    object.start_time.to_i
  end
end
