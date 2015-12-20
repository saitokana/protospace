class AddUrlToPrototype < ActiveRecord::Migration
  def change
    add_column :prototypes, :url, :string
  end
end
