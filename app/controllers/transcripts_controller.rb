class TranscriptsController < ApplicationController

  # GET /transcripts
  def index
    # Handle all or moments and later channels
    @transcripts = if params.key?("moment")
      moment = Moment.find_by(id: params["moment"])
      moment.nil? ? [] : moment.transcript
    else
      # By default return a handful of items
      TranscriptPart.limit(100)
    end

    # Result filtering
    if use_filter? && !@transcripts.empty?
      @transcripts = @transcripts.where(met_start: params["start"]..params["end"])
    end
    render json: @transcripts
  end


  private
    def use_filter?
      params.key?("start") && params.key?("end")
    end
end
