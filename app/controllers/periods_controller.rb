class PeriodsController < ApplicationController
  respond_to :json
  
  before_action :get_design
  before_action :get_period, except: [ :index, :create ]
  
  def index
    if @design
      @periods = @design.periods
    end
  end

  def show
    head :not_found unless @period
  end

  def update
    if @period
      if @period.update_attributes(period_params)
        head :no_content
      else
        render :errors, status: :unprocessable_entity
      end
    else
      if @design
        if @period = @design.periods.create!(period_params)
          render :show, status: :created
        else
          render :errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    if @period
      @period.destroy
      head :no_content
    else
      head :not_found
    end
  end
  
  private
  
  def get_design
    head :bad_request unless @design = Design.find(params[:design_id])
  end
  
  def get_period
    if params[:period]
      params[:period][:id] = params[:id]
    end
    
    if @design
      @period = @design.periods.find(params[:id])
    end
  end
  
  def period_params
    params.require(:period).permit(
      :id,
      :name,
      :activity,
      :starts_at,
      :ends_at
    )
  end
end
