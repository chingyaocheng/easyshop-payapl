class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :cart_is_not_empty, only: [:new]



  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new

  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.customer_ip = request.remote_ip

    add_cart_item_to_order

    # respond_to do |format|
      if @order.save
        @cart.cart_items.destroy_all
        redirect_to @order.paypal_url(order_path(@order))

        # format.html { redirect_to @order, notice: '訂單成立!' }
        # format.json { render :show, status: :created, location: @order }
      # else
        # format.html { render :new }
        # format.json { render json: @order.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :ship_to_address, :phone_number, :ship_to_name, :ship_to_phone_number, :status, :customer_ip, :email)
    end


    def cart_is_not_empty
      if @cart.cart_items.count < 1
        redirect_to :back, notice: "Cart can not be empty @@"
      end
    end

    def add_cart_item_to_order
    @cart.cart_items.each do |item|
      order_item = OrderItem.new(
        :product_id => item.product_id,
        :price => item.product.price,
        :quantity => item.quantity
      )
      @order.order_items << order_item
    end
  end

end
