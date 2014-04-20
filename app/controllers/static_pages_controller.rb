class StaticPagesController < ApplicationController
  
  def home
    @user = User.new
  end
  
  def about
    @user = User.new
  end
  
  def privacy
    @user = User.new
  end
  
  def terms
    @user = User.new
  end
end
