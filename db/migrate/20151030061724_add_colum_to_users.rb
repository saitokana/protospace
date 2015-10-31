class AddColumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile, :string
    add_column :users, :position, :string
    add_column :users, :member, :string
  end
end
