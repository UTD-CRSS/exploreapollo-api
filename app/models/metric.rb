class Metric < ApplicationRecord
  store_accessor :data
  belongs_to :channel

  validates_uniqueness_of :type, scope: [:met_start, :met_end, :channel_id],
  	message: 'identical metrics entry is already in database' 
end
