class User < ActiveRecord::Base
 	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

    has_many :carts
    has_many :orders

    def self.current_cart
    	if current_user
    		Cart.find(current_user.current_cart)
    	end
    end
end
