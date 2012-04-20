class StoreController < ApplicationController
  
  def index
  	#@products = Product.all
  	@q = Product.search(params[:q])
    @products = @q.result(:distinct => true)
  end

end
