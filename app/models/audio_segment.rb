class AudioSegment < ApplicationRecord
  include FriendlyIdAble

  belongs_to :channel
end
