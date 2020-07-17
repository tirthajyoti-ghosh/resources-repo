class AddVotesCountToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :votes_count, :integer
  end
end
