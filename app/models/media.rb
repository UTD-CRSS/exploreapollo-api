class Media < ApplicationRecord
  include FriendlyIdAble

  validates_presence_of :url, :mission_id

  belongs_to :mission
  has_many :media_attachments, dependent: :destroy
end
