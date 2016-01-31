class MomentSerializer < ActiveModel::Serializer
  attributes :id, :description, :title
  attribute :met_start, key: :metStart
  attribute :met_end, key: :metEnd
  attribute :friendly_id, key: :name
  
  attribute :cached_audio_url, key: :audioUrl
  attributes :mission
end
