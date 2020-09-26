class Moment < ApplicationRecord
  include AudioCacheable
  include FriendlyIdAble

  validates_presence_of :description
  validates_presence_of :met_start, :met_end

  has_and_belongs_to_many :stories
  has_and_belongs_to_many :channels
  has_many :transcript_items, through: :channels
  has_many :audio_segments, through: :channels
  has_many :metrics, through: :channels
  has_many :media_attachments, as: :media_attachable, dependent: :destroy
  has_many :media, through: :media_attachments, dependent: :destroy
  has_many :channel_media, ->(moment) {where(met_start: moment.met_start..moment.met_end)}, through: :channels, source: :media_attachments

  def all_media_attachments
    media_attachments + channel_media
  end

  def moment_metrics
    metrics.where(met_start: met_start..met_end)
  end

  def moment_audio_segments
    audio_segments.where(met_start: met_start..met_end)
  end

  def transcript
    transcript_items.where(met_start: met_start..met_end)
  end

  def mission
    Mission.first
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
