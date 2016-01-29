class CacheMomentAudioJob < ApplicationJob
  queue_as :default

  def perform(*args)
    id = args["id"]
    Moment.find(id).cache_audio!
  end
end
