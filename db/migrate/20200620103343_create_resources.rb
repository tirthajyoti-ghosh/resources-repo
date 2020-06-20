class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :link
      t.text :notes
      t.references :user

      t.timestamps
    end
  end
end
