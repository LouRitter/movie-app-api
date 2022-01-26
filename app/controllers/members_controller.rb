class MembersController < ApplicationController
    before_action :authenticate_user!
  
    def show
      render json: { message: "If you see this, you're in!" }
    end
    def movies
      render json: current_user.movies 
    end
end