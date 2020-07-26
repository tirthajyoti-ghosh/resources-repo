class ChangeSavedResourcesToSavings < ActiveRecord::Migration[6.0]
  def change
    rename_table :saved_resources, :savings
  end
end
