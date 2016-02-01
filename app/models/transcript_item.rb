class TranscriptItem < ApplicationRecord
  belongs_to :person
  belongs_to :channel

  validates_presence_of :text, :met_start, :met_end, :person, :channel
  
  default_scope { order(:met_start) }
end
