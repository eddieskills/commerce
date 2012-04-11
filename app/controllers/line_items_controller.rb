class LineItemsController < ApplicationController

  def create
    @cart = current_cart
    product = Product.find(params[:product_id]);

    @line_item = LineItem.new
    @line_item.cart_id = @cart.id
    @line_item.product_id = product.id

    if @line_item.save
      flash[:error] = "Le produit a bien ete ajoute au panier"
      redirect_to @cart
    else
      flash[:error] = "Le produit n'a pas pu etre ajoute au panier"
      redirect '/store/index/'
    end

  end

end
