class Channel < ApplicationRecord
  has_and_belongs_to_many :moments
  has_many :transcript_parts
end
