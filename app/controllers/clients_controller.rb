class ClientsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create, :new]
  
  def show
    @client = Client.find(params[:id])
  end
  
  def new
    @client = Client.new
    session[:current_client_id] = @client.id
    redirect_to :controller => 'therapists', :action => 'index'
  end
  
  def create
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @user = current_user
      @user.role = Client.create(client_params)
      puts "#{@user.role.description}"
      puts "client saved!"
      @user.save
      @user.role.save
    end
  end
  
  def charge
  end
  
  def save_c
    @client = @_current_client
    @client.stripe_token = params[:stripeToken]
    @client.email = params[:stripeEmail]
    @client.save
    @client.save_client_card
    
    render "clients/finish"
    reset_session
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    render "clients/save_c"
  end
  
  def update
    @client = @_current_client
    if @client.update_attributes(client_params)
      session[:current_client_id] = @client.id
      redirect_to '/paysecure'
    else
      render "clients/update"
    end
  end
  
  def finish
    @client = @_current_client
    if @client.update_attributes(client_params)
      @client.save
      reset_session
    else
      render "clients/update"
      flash[:fail] = "Sorry there was an error processing your entries."
    end
  end
  
  private
  
  def client_params
    params.require(:client).permit(:name, :phone, :zipcode, :time_zone, :age, :insurance, :gender, :gender_pref, :description, :promo_code, :price, 
    :stripe_token,
    :flag_therapist, :therapist_id, user_attributes: [ :id, :email, :password ])
  end
end
