class FixColumnName1 < ActiveRecord::Migration[6.0]
  def change
    def change
      rename_column :users, :email_string, :email
  end
  end
end
