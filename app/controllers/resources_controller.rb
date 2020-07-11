class ResourcesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = Resource.includes(:categories).all
  end

  def show
  end
  
  def new
    @resource = Resource.new
  end

  def edit
  end

  def create
    @resource = current_user.resources.build(resource_params)
    if @resource.save
      flash[:success] = "Resource successfully created!"
      redirect_to @resource
    else
      flash[:error] = "Something went wrong."
      render 'new'
    end
  end

  def update
    if @resource.update_attributes(resource_params)
      flash[:success] = "Resource was successfully updated!"
      redirect_to @resource
    else
      flash[:error] = "Something went wrong."
      render 'edit'
    end
  end

  def destroy
    if @resource.destroy
      flash[:success] = 'Resource was successfully deleted.'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong.'
      redirect_to @resource
    end
  end  
  
  private
  
  def set_resource
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:link, :notes, :category_list)
  end
end
