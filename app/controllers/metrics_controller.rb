class MetricsController < ApplicationController
  include FriendlyParams
  before_action :set_metric, only: [:show, :update, :destroy]

  # GET /metrics
  def index
    @metrics = if params.key?("moment_id")
      moment = Moment.find_by(id: params["moment_id"])
      moment.nil? ? [] : moment.moment_metrics
    elsif params.key?("channel_id")
      channel = Channel.find_by(id: params["channel_id"])
      channel.nil? ? [] : channel.metrics
    else
      # By default return a handful of items
      Metric.limit(100)
    end

    # Result filtering
    if use_filter? && !@metrics.empty?
      @metrics = @metrics.where(met_start: params["met_start"]..params["met_end"])
    end

    render json: @metrics
  end

  # GET /metrics/1
  def show
    render json: @metric
  end

  # POST /metrics
  def create
    @metric = Metric.new(@friendly_params)

    if @metric.save
      render json: @metric, status: :created, location: metric_url(@metric)
    else
      render json: @metric.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /metrics/1
  def update
    if @metric.update(@friendly_params)
      render json: @metric
    else
      render json: @metric.errors, status: :unprocessable_entity
    end
  end

  # DELETE /metrics/1
  def destroy
    @metric.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metric
      @metric = Metric.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def metric_params
      params.require(:metric).permit(:type, :met_start, :met_end, :channel_id, data: [:count])
    end

    def use_filter?
      params.key?("met_start") && params.key?("met_end")
    end
end
