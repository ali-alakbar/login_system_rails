class PasswordResetsController < ApplicationController
    
    def new
        
    end
    def create
        @user = User.find_by( email: params[:email])
        if @user.present?
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        redirect_to root_path, notice: "An email has been sent to you to confirm your identity."
    end

    def edit
        # find_signed! helps us to find the token from our user model
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        rescue ActiveSupport::MessageVerifier::InvalidSignature

        redirect_to signin_path, notice: "Token has been expired."

    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(allow)
            redirect_to root_path, notice: "Password updated!"
        else
            render :edit
        end
        
    end
    private
    def allow
        params.require(:user).permit(:password, :password_confirmation)
    end
end