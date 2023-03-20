class PagesController < ApplicationController
  def home
  end

  def index
    @logged_in = user_signed_in?
    @user = User.all
  end
end
