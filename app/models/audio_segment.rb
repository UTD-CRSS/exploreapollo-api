class AudioSegment < ApplicationRecord
  include FriendlyIdAble

  belongs_to :channel

  default_scope { order(:met_start) }
end
