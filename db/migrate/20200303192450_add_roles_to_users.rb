class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :is_agent, :boolean, default: false
  end
end
