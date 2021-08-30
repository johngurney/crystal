class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.string :description
      t.boolean :policy_action

      t.timestamps
    end
  end
end
