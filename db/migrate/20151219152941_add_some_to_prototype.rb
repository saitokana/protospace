class AddSomeToPrototype < ActiveRecord::Migration
  def change
  	add_column :prototypes, :cost, :integer
  	add_column :prototypes, :time, :integer
  	remove_column :prototypes, :concept, :string
  	remove_column :prototypes, :catch_copy, :string
  end
end
