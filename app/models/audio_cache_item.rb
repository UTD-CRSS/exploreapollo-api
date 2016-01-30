class AudioCacheItem < ApplicationRecord

  def self.with_audio_attrs obj
    where(
      "channels = ARRAY[?] AND met_start = ? AND met_end = ? AND format = ?",
      obj[:channels], obj[:met_start], obj[:met_end], obj[:format]
    )
  end
end
