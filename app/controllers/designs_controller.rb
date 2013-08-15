class DesignsController < ApplicationController
  respond_to :json
  
  before_action :get_design, except: [ :index, :create ]
  
  def index
    @designs = Design.all.entries
  end

  def show
    head :not_found unless @design
  end

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
  
  # We added this method to handle requests for a specific attribute
  def attribute
    # Check that an attribute was passed and -- IMPORTANT --
    # check that it is an ALLOWED attribute
    if (attr = params[:attribute]) &&
      %w(id title created_at updated_at).include?(attr)
      
      # If the attribute is present in the body of the request
      # as opposed to just in the URL, then this is a patch
      # request to update the attribute, so let's do so
      if params[attr]
        # The setter is the getter with an = appended (e.g., title=)
        # The second parameter here is passed as the argument to
        # the setter
        if @design.__send__(attr.to_s + "=", params[attr])
          @design.save
          head :no_content
        else
          head :bad_request
        end
      else
        # Create a hash with this attribute and its value
        out = Hash.new
        out[attr] = @design.__send__(attr)
        
        # Render the hash as JSON
        render :json => out
      end
      
    else
      # No attribute or not in list? Bad request
      head :bad_request
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
