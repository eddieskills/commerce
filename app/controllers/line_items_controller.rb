class LineItemsController < ApplicationController

  def create
    @cart = current_cart
    product = Product.find(params[:product_id]);

    @line_item = LineItem.new
    @line_item.cart_id = @cart_id
    @line_item.product_id = @product_id

    if @line_item.save
      redirect_to @cart
    else
      flash[:error] = "Le produit n'a pas pu etre ajoute au panier"
      redirect '/store/index/'
    end

  end

end
