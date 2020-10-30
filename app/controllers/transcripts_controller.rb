class TranscriptsController < ApplicationController
  # GET /transcripts
  def index
    # Handle all or moments and later channels
    @transcripts = if params.key?("moment_id")
      moment = Moment.find_by(id: params["moment_id"])
      moment.nil? ? [] : moment.transcript
    elsif params.key?("channel_id")
      channel = Channel.find_by(id: params["channel_id"])
      channel.nil? ? [] : channel.transcript_items
    else
      # By default return a handful of items
      TranscriptItem.limit(100)
    end

    # Result filtering
    if use_filter? && !@transcripts.empty?
      @transcripts = @transcripts.where(met_start: params["met_start"]..params["met_end"])
    end
    render json: @transcripts, each_serializer: TranscriptSerializer
  end


  private
    def use_filter?
      params.key?("met_start") && params.key?("met_end")
    end
end
