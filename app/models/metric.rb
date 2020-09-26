class Metric < ApplicationRecord
  store_accessor :data
  belongs_to :channel
end
