class Admin::OrdersController < AdminController
  
  layout 'store'

  def new
    if current_cart.line_items.empty?
      flash[:error] = "Votre panier est vide"
      redirect_to '/store/index'
    else
      @order = Order.new
    end
  end

  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)
    
    if @order.save
      Notifier.order_received(@order).deliver
      session[:cart_id] = nil
      flash[:success] = "Votre commande a bien ete passee"
      redirect_to [:admin, @order]
    else
      # afficher une vue différente de mon action
      render "new"
    end
  end

  def index
    #@orders = Order.paginate(:page => params[:page], :per_page => 5)
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def show
    @order = Order.find(params[:id])
    @orders = @order.line_items
  end

end
