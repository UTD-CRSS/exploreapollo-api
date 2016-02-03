class Media < ApplicationRecord
  include FriendlyIdAble

  has_many :media_attachments, dependent: :destroy
end
