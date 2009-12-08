class SessionsController < ApplicationController
  def new

  end

  def create
    puts Digest::SHA1.hexdigest(params[:password])
    if Digest::SHA1.hexdigest(params[:password]) == Configuration.get(:password)
      flash[:notice] = 'Logged in successfully.'
      session[:login] = true
      redirect_to root_url
    else
      flash.now[:error] = 'Password is incorrect.'
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
