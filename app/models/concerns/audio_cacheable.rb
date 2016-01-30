require 'open-uri'


# Expects audio_attrs and cache_name to be defined
module AudioCacheable
  extend ActiveSupport::Concern

  def cached_audio_url
    cache_item = AudioCacheItem.with_clip_attrs(audio_attrs).first
    if cache_item.nil?
      cache_item = cache_audio!
    end
    cache_item.url
  rescue => e
    Rails.logger.error e
    ""
  end

  def cache_audio!
    audioUrl = audio_server_url false
    local_path = download_url audioUrl
    remote_path = upload_to_cache local_path
    chan_ids = channels.pluck(:id)
    # Add item to cache
    cache_item = AudioCacheItem.with_clip_attrs(audio_attrs)
    new_attrs = audio_attrs.merge(url: remote_path)
    cache_item = cache_item.create new_attrs unless cache_item.exists?
    ap cache_item
    Rails.logger.info "Cached audio at #{remote_path}"
    cache_item
  end

  def download_url url
    tmp_dir = Rails.root.join("tmp")
    path = File.join(tmp_dir, cache_name)
    Rails.logger.info "Downloading #{url} to #{path}"
    down = open(url)
    IO.copy_stream(down, path)
    path
  end

  def storage_connection
    cfg = Rails.application.config_for(:explore_app)
    connection = Fog::Storage.new({
      provider: "AWS",
      aws_access_key_id: cfg["aws_access_key"],
      aws_secret_access_key: cfg["aws_secret_key"],
      region: "us-west-2"
    })
  end

  def upload_to_cache local_path
    bucket = Rails.application.config_for(:explore_app)["cache_bucket"]
    Rails.logger.info "Uploading #{local_path} to #{bucket}"

    # Connect
    connection = storage_connection
    bucket = connection.directories.get(bucket)

    # Should use hash digest to id files
    version = Time.now.to_i # Use time for now to bust cache with same audio
    remote_name = "#{version}-#{cache_name}"

    file_object = bucket.files.create({
      :key => remote_name,
      :body => File.open(local_path),
      :content_type => "audio/mp4",
      :public => true
    })
    file_object.public_url
  end
end
