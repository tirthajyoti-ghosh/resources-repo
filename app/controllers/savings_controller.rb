class SavingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @saved_resources = current_user.saved_resources
  end
end
