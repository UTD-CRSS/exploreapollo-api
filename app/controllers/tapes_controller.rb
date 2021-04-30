class TapesController < ApplicationController
    include FriendlyParams
    def index
        render json: Tape.all
    end

    def show
        render json: @tape
    end
      
end
