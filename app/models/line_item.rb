class LineItem < ActiveRecord::Base

	belongs_to :cart
	belongs_to :product
	belongs_to :order
	
	after_create :update_total_with_new
	after_update :update_total_with_modified_quantity
	after_destroy :update_total_with_destroy


	def total 
		self.product.price * self.quantity
	end

	def total_was
		self.product.price * self.quantity_was
	end

	def total_products 
		self.cart.totalProducts += self.quantity
	end

	def total_products_was
		self.cart.totalProducts -= self.quantity_was
	end

	def update_total_with_new
		self.cart.total += self.total
		self.total_products
		self.cart.save
	end

	def update_total_with_modified_quantity
		if self.quantity_changed?
			self.cart.total -= self.total_was
			self.total_products_was
			self.update_total_with_new
		end
	end

	def update_total_with_destroy
		self.cart.total -= self.total_was
		self.total_products_was
		self.cart.save
	end

	

end
