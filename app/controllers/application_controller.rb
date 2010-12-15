class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :signed_in?, :preview_events, :tweets, :random_users

  private

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end
  
  def preview_events
    @preview_events ||= Event.preview_events
  end

  def tweets
    cache(:tweets, :expires_in => 1.minute) do
      logger.debug "fetching new tweets"
      Twitter::Search.new.q("rails OR ruby OR rughh").geocode(53.561858,9.962021,'100km').rpp(5).fetch
    end
  rescue
    []
  end
  
  def random_users
    cache(:random_users, :expires_in => 1.minute) do
      User.random
    end
  rescue
    []
  end

end
