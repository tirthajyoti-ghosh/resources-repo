class PopulateResourceVotesCount < ActiveRecord::Migration[6.0]
  def up
    Resource.find_each do |resource|
      Resource.reset_counters(resource.id, :votes)
    end
  end
end
