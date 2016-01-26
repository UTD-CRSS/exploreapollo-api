class TranscriptPart < ApplicationRecord
  default_scope { order(:met_start) }
end
