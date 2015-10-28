class HomeController < ApplicationController
  def index
    #temporarily redirect straight to 'talent' for all logged in users.
    redirect_to '/talent' if user_signed_in?
  end

  def talent
    render layout: 'talent'
  end
end
