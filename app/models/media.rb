class Media < ApplicationRecord
  include FriendlyIdAble

  belongs_to :mission
  has_many :media_attachments, dependent: :destroy
end
