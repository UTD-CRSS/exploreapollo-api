class TapesController < ApplicationController
    include FriendlyParams
    before_action :get_mission
    def index
        render json: @mission.tapes
    end

    def show
        render json: Tape.find(params[:id])
    end
      
    private

    def get_mission
        @mission = Mission.find(params[:mission_id])
    end
end