require 'open-uri'

module AudioCacheable
  extend ActiveSupport::Concern

  def cache_audio!
    local_path = download_moment_audio
    remote_path = upload_to_cache local_path
    update_attribute :audio_url, remote_path
    Rails.logger.info "Cached audio at #{remote_path}"
  end

  def cache_name
    "moment_#{id}.mp4"
  end

  def download_moment_audio
    tmp_dir = Rails.root.join("tmp")
    name = cache_name
    path = File.join(tmp_dir, name)
    audioUrl = audio_server_url false
    Rails.logger.info "Downloading #{audioUrl} to #{path}"
    down = open(audioUrl)
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
