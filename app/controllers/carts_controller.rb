class CartsController < ApplicationController

  layout 'store'

  def show
    @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = Cart.find(params[:id]).destroy
    flash[:notice] = "Votre panier a bien ete supprime"
    redirect_to root_url
  end

end