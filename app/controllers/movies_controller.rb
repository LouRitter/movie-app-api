class MoviesController < ApplicationController
    def search
      render json: MovieService.new(params[:query]).search
    end

    def create
      @movie = Movie.new(movie_params)
      @current_user.movies << @movie
      if @movie.save
        render json: @movie
      else
        render json: @movie.errors, status: 422
      end
    end

    private 

    def movie_params
      params.require(:movie).permit(:title, :genre_ids, :id, 
        :media_type, :overview, :poster_path, :release_date)

    end
end