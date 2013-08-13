class DesignsController < ApplicationController
  respond_to :json
  
  before_action :get_design, except: [ :index, :create ]
  
  def index
    @designs = Design.all.entries
  end

  def show
    head :not_found unless @design
  end

  # We've deleted the create action and moved creation into the
  # update method. A UUID is always supplied as params[:id].
  # If we find a design with that ID, then we do an update;
  # if we don't find a design with that ID, then we create one.
  def update
    if @design
      if @design.update_attributes(design_params)
        head :no_content
      else
        render :errors, status: :unprocessable_entity
      end
    else
      if @design = Design.create(design_params)
        render :show, status: :created
      else
        render :errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @design
      @design.destroy
      head :no_content
    else
      head :not_found
    end
  end
  
  private
  
  def get_design
    if params[:design]
      params[:design][:id] = params[:id]
    end
    
    @design = Design.find(params[:id])
  end
  
  def design_params
    params.require(:design).permit(:id, :title)
  end
end
