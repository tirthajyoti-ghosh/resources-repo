class ResourcesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def show
  end

  def new
    @resource = Resource.new
  end

  def edit
  end
end
