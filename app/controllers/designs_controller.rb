class DesignsController < ApplicationController
  respond_to :json # Expect only JSON formats (saves having to specify)
  
  # We're going to need to set the @design variable based on
  # params[:id] for all actions except index and create, so
  # why not do it in a callback.
  before_action :get_design, except: [ :index, :create ]
  
  def index
    # Remember that mongoid returns a cursor for "all", so you
    # must call "entries" on it to get the array of designs.
    @designs = Design.all.entries
  end

  def show
    # If the design with the passed ID was not found, then we fall
    # through to the 404 not found status set in the get_design
    # method below.
  end
  
  def create
    # Try to create a new design with the passed params
    if @design = Design.create(design_params)
      # If the design was successfully created, return it as JSON
      # with a status of 201 created.
      render :show, status: :created
    else
      # If creation fails, render the errors.json.rabl template
      # with a status of 422 unprocessable entity
      render :errors, status: :unprocessable_entity
    end
  end

  def update
    # If we found a design with the passed ID, then attempt to update it
    if @design
      # Try to update the design
      if @design.update_attributes(design_params)
        # Successful update? Return 204 no content
        head :no_content
      else
        # Unsuccessful update, return the errors template with
        # a 422 unprocessable entity status
        render :errors, status: :unprocessable_entity
      end
    end
    # Otherwise, we fall through to the not found status set
    # in the get_design method below.
  end

  def destroy
    if @design
      # If we found the design with the passed ID, destroy it
      # and return 204 no content.
      @design.destroy
      head :no_content
    end
    # Otherwise, we fall through to the not found status set
    # in the get_design method below.
  end
  
  private
  
  def get_design
    # Set a 404 not found header here if we don't find the design
    head :not_found unless @design = Design.find(params[:id])
  end
  
  def design_params
    params.require(:design).permit(:title)
  end
end
