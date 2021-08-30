class AddDevelopmentIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :development_id, :integer
  end
end
