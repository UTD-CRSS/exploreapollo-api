class TranscriptItemSerializer < ActiveModel::Serializer
  attributes :id, :channel_id

  attribute :text
  attribute :met_start, key: :metStart
  attribute :met_end, key: :metEnd

  belongs_to :channel
  belongs_to :person
end
