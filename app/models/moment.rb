class Moment < ApplicationRecord
  include AudioCacheable
  include FriendlyIdAble

  has_and_belongs_to_many :stories
  has_and_belongs_to_many :channels
  has_many :transcript_parts, through: :channels

  validates_presence_of :met_start, :met_end

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

  def audio_attrs
    audio_attrs = {
      channels: channels.pluck(:id),
      met_start: met_start,
      met_end: met_end,
      format: "mp4",
    }
  end

  def cache_name
    "moment_#{id}.mp4"
  end

  def audio_server_url stream=true
    mission_id = 11 # This should come from somewhere
    chans = channels.pluck(:id)
    duration = met_end - met_start
    base = Rails.application.config_for(:explore_app)["audio_server_url"]
    path = if stream
      "/stream"
    else
      "/audio"
    end
    q_build = [
      "?mission=", mission_id,
      "&channels=", chans.join(","),
      "&start=", met_start,
      "&duration=", duration
    ]
    q_build.push("&format=mp3") if stream
    [base, path, *q_build].join("")
  end
end
