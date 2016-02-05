class MediaAttachmentSerializer < ActiveModel::Serializer
  attributes :id, :media_id, :media_attachable_type, :media_attachable_id
  attributes :met_start, :met_end
end
