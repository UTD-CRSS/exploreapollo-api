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
    mission_id = 11 # This should come from somewhere
    chans = channels.pluck(:id)
    duration = met_end - met_start
    url_build = [
      Rails.application.config_for(:explore_app)["audio_server_url"],
      "?mission=", mission_id,
      "&channels=", chans.join(","),
      "&start=", met_start,
      "&duration=", duration
    ].join("")
  end
end
