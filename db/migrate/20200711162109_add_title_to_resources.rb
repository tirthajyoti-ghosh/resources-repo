class AddTitleToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :title, :string
  end
end
