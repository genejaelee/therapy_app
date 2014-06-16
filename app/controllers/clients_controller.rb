class ClientsController < ApplicationController
  
  def show
    @client = Client.find(params[:id])
  end
  
  def new
    @client = Client.new
    @client.update_attributes(:time_zone => cookies["jstz_time_zone"])
    session[:current_client_id] = @client.id
    redirect_to :controller => 'therapists', :action => 'index'
  end
  
  def create
    @client = Client.new(client_params)
    @client.update_attributes(:time_zone => cookies["jstz_time_zone"])
    if @client.save
      session[:current_client_id] = @client.id
      #if @client.promo_code == "WHISPER033"
        #render "clients/create"
        redirect_to :controller => 'therapists', :action => 'index'
        #else
        #render :action => :charge
        #end
    else
      render "static_pages/home"
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
  
  def drop_email
    @client = @_current_client
    if @client.update_attributes(client_params)
      redirect_to root_url
      flash[:success] = "Thanks for reaching out."
    else
      redirect_to :controller => 'therapists', :action => 'index'
      flash[:fail] = "Sorry there was an error processing your entries."
    end
  end
  
  private
  
  def client_params
    params.require(:client).permit(:name, :phone, :email, :password, :zipcode, :time_zone, :age, :insurance, :gender, :gender_pref, :description, :promo_code, :current_therapist, :current_therapist_name, :price, 
    :stripe_token,
    :flag_therapist)
  end
end
