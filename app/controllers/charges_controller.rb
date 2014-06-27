class ChargesController < ApplicationController
  layout "application"
  
  def new
    @amount = 4000
    
    @user = current_user
    @client = @user.role
    puts "current client has id #{@client.id}"
  end

  def create
    @amount = 4000
    @user = current_user
    @client = @user.role

    customer = Stripe::Customer.create(
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    
    @client.update_attributes(:stripe_token => params[:stripeToken])

  redirect_to :action => 'generate', :controller => 'chats'
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :action => 'new', :controller => 'charges'
  end
end
