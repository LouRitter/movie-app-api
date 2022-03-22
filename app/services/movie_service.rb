class MovieService < ApplicationService
    require 'faraday/net_http'
    Faraday.default_adapter = :net_http

    attr_reader :movie

    def initialize(movie)
      @movie = movie
    end
  
    def search
        @api_key = ENV['MOVIEDB_API_KEY']
        response = Faraday.get("https://api.themoviedb.org/3/search/multi?api_key=#{@api_key}&query=#{@movie}")
        return response.body
    end
  end