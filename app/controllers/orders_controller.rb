class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]
  before_action :authenticate_user!
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

    @listing = Listing.find(params[:listing_id])
    @profile = Profile.find(@listing.user_id)

    @order = Order.new()
    @order.user = current_user
    @order.title = @listing.title
    @order.seller = @profile.user_name
    @order.ammount = (@listing.price * params[:duration])

    Stripe.api_key = ENV['STRIPE_API_KEY_SK']
    
    @stripe_session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
            name: @listing.title,
            description: @listing.description,
            amount: @listing.price,
            currency: 'AUD',
            quantity: params[:duration]
        }],
        success_url: 'http://localhost:3000/success',
        cancel_url: 'http://localhost:3000/cancel'
    )
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
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
end
