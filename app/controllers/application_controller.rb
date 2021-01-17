class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    #before_action :authenticate_user!
    
    def user_is_logged_in?
      if !session[:oktastate]
        redirect_to user_oktaoauth_omniauth_authorize_path
      end
    end

    def after_sign_in_path_for(resource)
      resource.env['omniauth.origin'] || root_path
    end

    #TODO: ??'
end
