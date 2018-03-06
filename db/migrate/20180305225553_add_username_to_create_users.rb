class AddUsernameToCreateUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    remove_columns :users, :name, :email
  end
end
