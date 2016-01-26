class Moment < ApplicationRecord
  has_and_belongs_to_many :channels, join_table: "moment_channel_join"
  has_many :transcript_parts, through: :channels

  def transcript
    transcript_parts.where(met_start: met_start..met_end)
  end
end
