class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :prototype
      t.references :user

      t.timestamps
    end
  end
end
