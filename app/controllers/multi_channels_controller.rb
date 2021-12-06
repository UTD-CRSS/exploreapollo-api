class MultiChannelsController < ApplicationController
    before_action :get_tape
    def index
        @multi_channels = @tape.multi_channels
    
        # filtering multi_channels using block_index, nugget_index and tape
        filtering_params(params).each do |key, value|
          @multi_channels = @multi_channels.public_send("filter_by_#{key}", value) if value.present?
        end
    
        render json: @multi_channels
    end
    
    def show
        @multi_channel = MultiChannel.find(params[:id])
        render json: @multi_channel
    end
    
    private
    
    def filtering_params(prams)
        params.slice(:channel, :block, :nugget, :tape)
    end

    def get_tape
        @tape = Tape.find(params[:tape_id])
    end
end
