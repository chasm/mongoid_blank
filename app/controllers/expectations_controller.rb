class ExpectationsController < ApplicationController
  respond_to :json
  
  before_action :get_design_and_period
  before_action :get_expectation, except: [ :index, :create ]
  
  def index
    if @period
      @expectations = @period.expectations
    end
  end

  def show
    head :not_found unless @expectation
  end

  def update
    if @expectation
      if @expectation.update_attributes(expectation_params)
        head :no_content
      else
        render :errors, status: :unprocessable_entity
      end
    else
      if @period
        if @expectation = @period.expectations.create!(expectation_params)
          render :show, status: :created
        else
          render :errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    if @expectation
      @expectation.destroy
      head :no_content
    end
  end
  
  private
  
  def get_design_and_period
    if @design = Design.find(params[:design_id])
      unless @period = @design.periods.find(params[:period_id])
        head :bad_request
      end
    else
      head :bad_request
    end
  end
  
  def get_expectation
    if params[:expectation]
      params[:expectation][:id] = params[:id]
    end
    
    if @period
      head :not_found unless @expectation = @period.expectations.find(params[:id])
    end
  end
  
  def expectation_params
    params.require(:expectation).permit(:behavior)
  end
end
