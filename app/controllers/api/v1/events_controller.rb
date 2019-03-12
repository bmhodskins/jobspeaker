class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /api/v1/events
  def index
    @events = Event.all
    render json: @events
  end

  # GET /api/v1/events/1
  def show
    render json: @event, status: :ok
  end

  # GET /api/v1/events/new
  def new
    @event = Event.new
  end

  # POST /api/v1/events
  def create
    @series = Series.new( { title: event_params[:title] } )
    @event = @series.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.json { render json: @event, status: :created }
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/events/1
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.json { render json: @event, status: :ok }
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/events/1
  def destroy

    respond_to do |format|
      if  @event.destroy
        format.json { render json: @event, status: :ok }
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      begin
        @event = Event.find(params[:id])
      rescue
        render json: @event, status: :not_found
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.fetch(:event).permit(:title, :location, :how_often, :day_of_the_week, :day_of_the_month, :from_time, :to_time, :of_the_param, :occurs_from_date, :occurs_to_date, :series_id)
    end
end
