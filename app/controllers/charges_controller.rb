class ChargesController < ApplicationController
  layout "application"
  
  def new
    @amount = 4000
  end

  def create
    @amount = 4000

    customer = Stripe::Customer.create(
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
