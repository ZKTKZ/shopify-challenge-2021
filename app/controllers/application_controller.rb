class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    #CURRENT USER AUTHENTICATION
    def user_is_logged_in?
      if !session[:oktastate]
        redirect_to user_oktaoauth_omniauth_authorize_path
      end
    end
end
