class Moment < ApplicationRecord
	has_and_belongs_to_many :stories, join_table: "moment_story_join"
  has_and_belongs_to_many :channels, join_table: "moment_channel_join"
  has_many :transcript_parts, through: :channels

  def transcript
    transcript_parts.where(met_start: met_start..met_end)
  end

  def mission
    {
      id: 1,
      title: "Apollo 11",
      length: 7.031e8
    }
  end

  def audio_url
    "https://aqueous-garden-9236.herokuapp.com/stream.mp3"
  end
end
