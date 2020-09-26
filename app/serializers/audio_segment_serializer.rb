class AudioSegmentSerializer < ActiveModel::Serializer
  attributes :id, :url, :met_start, :met_end
  attribute :friendly_id, key: :name

  belongs_to :channel
end
