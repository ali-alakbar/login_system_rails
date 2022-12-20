class MainController < ApplicationController
    def index
        flash.now[:one] = "This is the first flash!"
        flash.now[:second] = "This is the second flash!"
        
    end
end