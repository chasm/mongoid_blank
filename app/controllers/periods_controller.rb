class PeriodsController < ApplicationController
  respond_to :json
  
  before_action :get_design # we'll need the parent design
  before_action :get_period, except: [ :index, :create ]
  
  def index
    # If we don't have the parent design, it falls through
    # to the 400 bad request set in the get_design method below.
    if @design
      @periods = @design.periods
    end
  end

  def show
  end
  
  def create
    if @design
      # We create the new period on the design's periods array
      # so we know exactly which design it is being embedded in.
      if @period = @design.periods.create!(period_params)
        render :show, status: :created
      else
        render :errors, status: :unprocessable_entity
      end
    end
  end

  def update
    if @period
      if @period.update_attributes(period_params)
        head :no_content
      else
        render :errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @period
      @period.destroy
      head :no_content
    end
  end
  
  private
  
  def get_design
    # If we don't find a design, then that's a BAD REQUEST
    head :bad_request unless @design = Design.find(params[:design_id])
  end
  
  def get_period
    if @design
      # We get the period from the design's periods array, so we
      # KNOW that this period is embedded in the right design.
      head :not_found unless @period = @design.periods.find(params[:id])
    end
  end
  
  def period_params
    params.require(:period).permit(
      :name,
      :activity,
      :starts_at,
      :ends_at
    )
  end
end
