class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def oktaoauth
        #GET AND SAVE USER
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.save
            #UPDATE SESSION FOR OTHER CONTROLLERS
            session[:oktastate] = request.env["omniauth.auth"]
            session[:email] = @user.email
        else
            p @user.errors.full_messages
        end
        if @user.present?
            redirect_to root_path
            #redirect_to user_path(session[:oktastate][:uid]) #ot
        end
    end
end