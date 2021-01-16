class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def oktaoauth
        @user = User.from_omniauth(request.env["omniauth.auth"])
        #@user.save
        session[:oktastate] = request.env["omniauth.auth"]
        redirect_to root_path#user_path(session[:oktastate][:uid])
    end
end