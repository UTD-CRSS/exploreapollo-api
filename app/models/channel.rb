class Channel < ApplicationRecord
  has_and_belongs_to_many :moments, join_table: "moment_channel_join"
  has_and_belongs_to_many :topics
  has_many :transcript_parts
end
