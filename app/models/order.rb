class Order < ActiveRecord::Base

	has_many :line_items

	PAYMENT_TYPES = ["Check", "Credit card", "Purchase  Order"]

	validates_presence_of :name, :address, :email, :pay_type

	def add_line_items_from_cart(current_cart)
		
		# methode 1 : en mettant add_line_items_from_cart(current_cart) après le save dans order_controller
		# current_cart.line_items.each do |line_item|
		# 	line_item.order_id = self.id
		# 	line_item.save
		# end

		current_cart.line_items.each do |i|
			self.line_items << i
		end
		

	end

end
