class Admin::DashboardController < AdminController
	def show
		@total_orders = Order.count
	end
end