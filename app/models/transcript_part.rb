class TranscriptPart < ApplicationRecord
  belongs_to :speaker, class_name: :Person, foreign_key: :person_id
  
  default_scope { order(:met_start) }
end
