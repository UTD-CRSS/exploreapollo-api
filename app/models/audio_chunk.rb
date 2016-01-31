class AudioChunk < ApplicationRecord
  include FriendlyIdAble

  belongs_to :channel
end
