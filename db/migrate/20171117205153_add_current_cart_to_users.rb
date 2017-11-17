class AddCurrentCartToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :current_cart, :integer
  end
end
