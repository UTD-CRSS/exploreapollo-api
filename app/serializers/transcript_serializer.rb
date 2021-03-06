class TranscriptSerializer < ActiveModel::Serializer
  attributes :id, :channel_id

  attribute :text
  attribute :speaker_name, key: :speakerName
  attribute :met_start, key: :metStart
  attribute :met_end, key: :metEnd

  def speaker_name
    object.person.name
  end
end
