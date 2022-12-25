class SessionController < ApplicationController
    
    def new 

    end
    def create 
        user = User.find_by( email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to root_path, notice: "Signed in successfully."
        end
    end
    
    def remove 
        session[:user_id] = nil
        redirect_to root_path, notice: "You are logged out"
    end

end