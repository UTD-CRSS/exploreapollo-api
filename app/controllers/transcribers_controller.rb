class TranscribersController < ApplicationController
    def index
        ren json: Transcriber.all
    end
    def show
        @transcriber = Transcriber.find_by(multi_channel_id: params["multi_channel_id"])
        render json: @transcriber
    end
end
