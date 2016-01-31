class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :description, :title
  attribute :friendly_id, key: :name

  belongs_to :mission
  has_many :channel_chunks
  has_many :transcript_parts
end
