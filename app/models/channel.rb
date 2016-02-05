class Channel < ApplicationRecord
  include FriendlyIdAble

  validates_presence_of :description

  belongs_to :mission
  has_and_belongs_to_many :moments
  has_many :transcript_items
  has_many :audio_segments
  has_many :metrics

  has_many :media_attachments, as: :media_attachable, dependent: :destroy
  has_many :media, through: :media_attachments, dependent: :destroy
end
