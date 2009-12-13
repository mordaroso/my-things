class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  filter_parameter_logging :password

  def logged_in?
    session[:login]
  end
  helper_method :logged_in?

  def logged_in_required
    unless logged_in?
      flash[:error] = 'Authentication required'
      redirect_to root_url
    end
  end
end
