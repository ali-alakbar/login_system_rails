class SignupController < ApplicationController
    def new 
        @user = User.new
    end
    def create
        @user = User.new(allowingData)
        # If the user is successfully saved
        if @user.save
            # 
            # 1. This line will assign the browser cockies to the user ID .. meaning every user will have cookies associated with them.
            #       we will be re-directed to the root page, which main_controller is responisble for this page.
            #       Meaning, the cookies will be handled in the main_controller if we want to deal with it.
            # 
            session[:user_id] = @user.id
            # 2. Redirect to the home page(root page) with a note.
            redirect_to root_path, notice: "You are signed up seccessfully."
        else 
            render :new 
        end
    end
    private
    def allowingData
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end