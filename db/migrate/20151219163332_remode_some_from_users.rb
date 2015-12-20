class RemodeSomeFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :profile, :string
    remove_column :users, :position, :string
    remove_column :users, :member, :string
  end
end
