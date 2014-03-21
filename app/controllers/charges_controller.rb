class ChargesController < ApplicationController
  
  def new
  end
  
  def create
    # amount in cents
    token = params[:stripeToken]
    @amount = 500
    
    customer = Stripe::Customer.create(
      :email => @_current_user.email,
      :card => token
    )
    
    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Rails Stripe customer',
      :currency => 'usd'
    )
    
    #get customer to charge
    #customer_id = get_stripe_customer_id(user)
    redirect_to update_user_path
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
  
  private
  
end
