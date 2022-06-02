class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"] == params["password"])
        flash["notice"] = "You've logged in."
        redirect_to "/places"
      else
        flash["notice"] = "Unsuccessful login. Please try again."
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Unsuccessful login. Please try again."
      redirect_to "/sessions/new"
    end
  end

  def destroy
  end
end