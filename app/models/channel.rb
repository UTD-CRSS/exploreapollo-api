class Channel < ApplicationRecord
  include FriendlyIdAble

  validates_presence_of :description

  belongs_to :mission
  has_and_belongs_to_many :moments
  has_many :transcript_items
  has_many :audio_chunks
end
