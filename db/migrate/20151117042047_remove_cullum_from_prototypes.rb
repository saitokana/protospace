class RemoveCullumFromPrototypes < ActiveRecord::Migration
  def change
    remove_column :prototypes, :likes_count, :integer
    remove_column :prototypes, :comments_count, :integer
  end
end
