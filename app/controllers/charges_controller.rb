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
    
    @charge = @client.charges.new
    @event = Event.find_by(id: session[:event_id])
    @charge.update_attributes(:stripe_token => params[:stripeToken], 
                              :stripe_customer_id => customer.id, 
                              :amount => @amount, 
                              :event_id => @event.id, 
                              :therapist_id => @event.therapist_id)
                              
  redirect_to :action => 'generate', :controller => 'chats'
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :action => 'new', :controller => 'charges'
  end
end
