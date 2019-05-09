class OrderController < ApplicationController

    def show

        @listing = Listing.find(params[:id])
        
    end

    def new
        
        Stripe.api_key = ENV['STRIPE_API_KEY_SK']
        @listing = Listing.find(params[:listing_id])
        @session = Stripe::Checkout::Session.create(
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
end
