<<<<<<< HEAD
class TranscriptItem < ApplicationRecord
  belongs_to :person
  belongs_to :channel

  validates_presence_of :text, :met_start, :met_end, :person, :channel
  
  validates_uniqueness_of :text, scope: [:met_start, :met_end, :person, :channel],
    message: 'identical transcript item is already in database'
  
  default_scope { order(:met_start) }
end
=======
class TranscriptItem < ApplicationRecord
  belongs_to :person
  belongs_to :channel

  validates_presence_of :text, :met_start, :met_end, :person, :channel
  
  default_scope { order(:met_start) }
end
>>>>>>> master
