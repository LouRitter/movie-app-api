class MoviesController < ApplicationController
    def search
      render json: MovieService.new(params[:query]).search
    end

    def save
        @movie = Movie.new
        @movie.title = params[:movie]["title"]
        @movie.movie_info = params[:movie]
        @user = User.find(params[:user]["id"])
        @user.movies << @movie
        @movie.save
        @user.save
    end
end