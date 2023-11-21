class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def logged_in?
        !!current_user
    end

    def current_user
        if session[:user_id]
        User.find(session[:user_id])
        end
    end
end
