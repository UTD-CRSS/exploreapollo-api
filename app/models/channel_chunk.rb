class ChannelChunk < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :channel
end
