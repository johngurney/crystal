class CreateDevelopments < ActiveRecord::Migration[6.0]
  def change
    create_table :developments do |t|
      t.string :name
      t.string :description
      t.string :keywords
      t.integer :significance_in_sector
      t.integer :significance_general

      t.timestamps
    end
  end
end
