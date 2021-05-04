class MediaAttachment < ApplicationRecord
  belongs_to :media_attachable, polymorphic: true
  belongs_to :media
end
