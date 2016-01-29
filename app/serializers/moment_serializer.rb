class MomentSerializer < ActiveModel::Serializer
  attributes :id, :created , :description, :name, :title
  attribute :met_start, key: :metStart
  attribute :met_end, key: :metEnd
  
  attribute :cached_audio_url, key: :audioUrl
  attributes :mission
end
