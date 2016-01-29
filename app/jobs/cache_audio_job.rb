class CacheAudioJob 
  include SuckerPunch::Job
  workers 1
  
  def perform(moment_id)
    Moment.find(moment_id).cache_audio!
  end
end
