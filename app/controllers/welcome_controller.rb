class WelcomeController < ApplicationController
  def index
    redirect_to user_signed_in? ? my_path : new_user_session_path
  end
end
