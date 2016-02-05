class MomentSerializer < ActiveModel::Serializer
  attributes :id, :description, :title
  attribute :met_start, key: :metStart
  attribute :met_end, key: :metEnd
  attribute :friendly_id, key: :name
  
  attribute :cached_audio_url, key: :audioUrl
  attributes :mission
  has_many :media, key: :media

  # Lookup media from attachment. Need a better way to do this
  def media
     object.all_media_attachments.map {|a| b = a.attributes; b[:media] = a.media; b }
  end
end
