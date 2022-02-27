class ApplicationController < ActionController::Base
#   def current_user
#     Customer.first
#   end

    helper_method :current_user, :logged_in?

    # def current_user
    #   @current_user ||= User.find_by(email: session[:email]) if session[:email]
    # end

    # def logged_in?
    #   !current_user.nil?
    # end

    # def require_user
    #   return if logged_in?

    #   flash[:alert] = 'Log in to perform this action'
    #   redirect_to new_user_session_path
    # end
end
