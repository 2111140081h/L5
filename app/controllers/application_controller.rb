class ApplicationController < ActionController::Base
    rescue_from ActionController::Redirecting::UnsafeRedirectError do
        redirect_to root_url
    end
    
    helper_method :current_user
    private
        def current_user
            if session[:login_uid]
                User.find_by(uid: session[:login_uid])
            end
        end
end
