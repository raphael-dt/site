class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string, default: "extern"
    add_column :users, :password_salt, :string
  end
end
