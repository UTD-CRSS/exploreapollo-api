class AudioCacheItem < ApplicationRecord

  scope :with_clip_attrs, -> (obj) { where("channels = ARRAY[?] AND met_start = ? AND met_end = ? AND format = ?", obj[:channels], obj[:met_start], obj[:met_end], obj[:format]) }
end
