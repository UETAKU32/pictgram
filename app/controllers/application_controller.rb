class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger
  
  helper_method :current_user, :logged_in?, :format_datetime
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def format_datetime(datetime)
    date = datetime.strftime('%Y/%m/%d')
    time = datetime.strftime('%H:%M')
    "#{date} #{time}"
  end
end
