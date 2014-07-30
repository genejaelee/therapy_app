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
      :description => 'Plain White Couch Session',
      :currency    => 'usd'
    )
    
    @charge = @client.charges.new
    @event = Event.find_by(id: session[:event_id])
    @charge.update_attributes(:stripe_token => params[:stripeToken],
                              :stripe_customer_id => customer.id, 
                              :amount => @amount, 
                              :event_id => @event.id, 
                              :therapist_id => @event.therapist_id,
                              :stripe_email => @user.email)
                              
  session[:paid] = true
  session[:paid_amount] = @amount
  redirect_to :action => 'generate', :controller => 'chats'
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :action => 'new', :controller => 'charges'
  end
  
  def new_instant
    @amount = 3000
  end
  
  def create_instant
    @amount = 3000
    @event = Event.find_by(id: session[:event_id])
    @client = @event.client
    
    customer = Stripe::Customer.create(
      :card  => params[:stripeToken],
      :email => params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Plain White Couch Session',
      :currency    => 'usd'
    )
    
    @charge = @client.charges.new
    @charge.update_attributes(:stripe_token => params[:stripeToken],
                              :stripe_customer_id => customer.id, 
                              :amount => @amount, 
                              :event_id => @event.id, 
                              :therapist_id => @event.therapist_id,
                              :stripe_email => params[:stripeEmail])
                              
  session[:paid] = true
  session[:paid_amount] = @amount
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :action => 'new', :controller => 'charges'
  end
  
  def just_payment
    @amount = 4000
  end
  
  def process_payment
    @amount = 4000
    customer = Stripe::Customer.create(
      :card  => params[:stripeToken]
    )
    
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Plain White Couch Session',
      :currency    => 'usd'
    )
    
    @charge = Charge.new
    @charge.update_attributes(:stripe_token => params[:stripeToken], 
                              :stripe_customer_id => customer.id, 
                              :stripe_email => params[:stripeEmail],
                              :amount => @amount)
                              
    flash[:success] = "Payment was successfully processed."
    redirect_to homepage_path
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :action => 'just_payment', :controller => 'charges'
  end
end
