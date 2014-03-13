class StaticPagesController < ApplicationController
  
  def home
    @user = User.new
  end
  
  def about
  end
  
  def privacy
  end
  
  def terms
  end
end
