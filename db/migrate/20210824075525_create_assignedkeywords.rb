class CreateAssignedkeywords < ActiveRecord::Migration[6.0]
  def change
    create_table :assignedkeywords do |t|
      t.string :name
      t.integer :development_id

      t.timestamps
    end
  end
end
