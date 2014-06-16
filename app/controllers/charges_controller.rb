class ChargesController < ApplicationController
  layout "application"
  
  def new
    @amount = 4000
    
    @client = @_current_client
    puts "current client has id #{@client.id}"
  end

  def create
    @amount = 4000
    @client = @_current_client

    customer = Stripe::Customer.create(
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    
    @client.update_attributes(:email => params[:stripeEmail], :stripe_token => params[:stripeToken])

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
