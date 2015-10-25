class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string     :catch_copy
      t.string     :concept
      t.integer    :user_id
      t.integer    :likes_count
      t.integer    :comments_count
      
      t.timestamps 
    end
  end
end
