class Api::V1::SeriesController < ApplicationController
  before_action :set_series, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/series
  def index
    @series = Series.all
  end

  # GET /api/v1/series/1
  def show
    render json: @series, status: :ok
  end

  # GET /api/v1/series/new
  def new
    @series = Series.new
  end

  # GET /api/v1/series/1/edit
  def edit
  end

  # POST /api/v1/series
  def create
    respond_to do |format|
      if SeriesService.create(series_params)
        format.json { render json: @series, status: :created }
      else
        format.json { render json: series_params, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/series/1
  def update
    respond_to do |format|
      if SeriesService.update(series_params, @series)
        format.json { render json: @series, status: :ok }
      else
        format.json { render json: series_params, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/series/1
  def destroy
    respond_to do |format|
      if  @series.destroy
        format.json { render json: @series, status: :ok }
      else
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      begin
        @series = Series.find(params[:id])
      rescue
        render json: @series, status: :not_found
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      params.require(:series).permit(:title, :location, :how_often, :day_of_the_week, :day_of_the_month, :from_time, :to_time, :of_the_param, :occurs_from_date, :occurs_to_date, :series_id)
    end
end
