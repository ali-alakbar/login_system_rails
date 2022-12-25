class PasswordsController < ApplicationController

    before_action :require_user_loggedin!

    def new
        
    end
    def update
        @user = User.update(allow)
        if @user
            redirect_to root_path, notice: "Password updated!"
        else
            render :new
        end
    end

    private
    def allow
        params.require(:user).permit(:password, :password_confirmation)
    end
end