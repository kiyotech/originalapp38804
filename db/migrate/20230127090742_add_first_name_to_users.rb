class AddFirstNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :farst_name, :string, null: false
  end
end
