class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # if user.email_confirmed
      #   session[:user_id] = user.id
      #   redirect_to user
      # else
      #   flash.now[:error] = 'Please activate your account by following the 
      #   instructions in the account confirmation email you received to proceed'
      #   render 'new'
      # end
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:danger] = 'Bad email/password combination. Try again.'
      render 'new'
    end
  end

  def delete
    session.delete(:user_id)
    @current_user = nil
    redirect_to site_home_path
  end
end