class RemoveCurrentCartFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :current_cart
  end
end
