class Channel < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :mission
  has_and_belongs_to_many :moments
  has_many :transcript_parts
  has_many :channel_chunks
end
