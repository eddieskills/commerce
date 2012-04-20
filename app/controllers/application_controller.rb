class ApplicationController < ActionController::Base
  protect_from_forgery

  # pour disposer de la méthode dans toutes les vues
  helper_method :current_cart, :cart_status, :current_user

  def current_cart
  	Cart.find(session[:cart_id])
  rescue
  	cart = Cart.create
  	session[:cart_id] = cart.id
  	cart
  end
 
  def cart_status
  	#current_cart.totalProducts.to_s + " produits a " + number_to_currency(current_cart.total).to_s
  	current_cart.totalProducts.to_s + " produits a " + current_cart.total.to_s
  end


end
