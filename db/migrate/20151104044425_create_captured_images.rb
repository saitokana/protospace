class CreateCapturedImages < ActiveRecord::Migration
  def change
    create_table :captured_images do |t|
      t.text :name
      t.integer :role
      t.belongs_to :prototype

      t.timestamps
    end
  end
end
