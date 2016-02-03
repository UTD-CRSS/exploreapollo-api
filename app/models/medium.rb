class Medium < ApplicationRecord
  has_many :media_attachments, dependent: :destroy
end
