class TranscriptPart < ApplicationRecord
  belongs_to :speaker
  
  default_scope { order(:met_start) }
end
