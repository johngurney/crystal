class ApplicationController < ActionController::Base
  before_action :check_cookie_consent, except: [:test, :cookie_consent]
  before_action :check_logged_in, except: [:test, :cookie_consent, :log_in, :log_out]

  def check_cookie_consent
    if session[:cookie_consent].blank?
      if cookies[:cookie_consent].blank?
        render 'homepage/cookie_consent'
        false
      else
        session[:cookie_consent] = true
      end
    end
  end

  def check_logged_in

    #Check in case user deleted during session
    session[:logged_in_user] = nil if !session[:logged_in_user].blank? && !User.exists?(id: session[:logged_in_user].to_i)

    if session[:logged_in_user].blank?
      if cookies[:logged_in_token].blank? or !User.exists?(id: cookies[:logged_in_token].to_i)
        render 'homepage/password'
        false
      else
        session[:logged_in_user] = cookies[:logged_in_token].to_i
      end
    end
  end

  def logged_in_user
    user = User.find(session[:logged_in_user]) if !session[:logged_in_user].blank? and User.exists?(id:  session[:logged_in_user].to_i)
  end

  helper_method :logged_in_user
end
