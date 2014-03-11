class StaticPagesController < ApplicationController
  
  def home
    if request.session_options[:user]
      @user = User.new(request.session_options[:user])
    else
      @user = User.new
    end
  end
  
  def about
  end
  
  def privacy
  end
  
  def terms
  end
end
