class CreateSavedResources < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_resources do |t|
      t.references :resource, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :saved_resources, [:user_id, :resource_id], unique: true
  end
end
