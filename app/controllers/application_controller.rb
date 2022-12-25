class ApplicationController < ActionController::Base

    before_action :setCurrentUser
    # 
    # 
    # This is the cookies that we get from signup_controller
    # If [ the signed in user ] got the cookies with their ID
    # PLEASE FIND THAT USER AND SAVE IN THE VARIABLE of @user ---> WHY? because we can print it in the view file.
    # 
    # 
    def setCurrentUser
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end
    def require_user_loggedin!
        redirect_to root_path, alert: "You're not logged in." if Current.user.nil?
    end
end