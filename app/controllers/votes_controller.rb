class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = current_user.votes.build(resource_id: params[:resource_id])

    if @vote.save
      redirect_back fallback_location: root_path, notice: 'You voted for this resource'
    else
      redirect_back fallback_location: root_path, notice: 'You already voted for this resource'
    end
  end
end
