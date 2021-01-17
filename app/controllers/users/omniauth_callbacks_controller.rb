class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def oktaoauth
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.save
            session[:oktastate] = request.env["omniauth.auth"]
            session[:email] = @user.email
        else
            p @user.errors.full_messages
        end
        if @user.present?
            p 'root path: ' + root_path
            redirect_to root_path
            #redirect_to user_path(session[:oktastate][:uid]) #ot
        end
    end
end