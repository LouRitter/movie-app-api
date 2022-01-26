class MovieService < ApplicationService
    attr_reader :movie

    require 'faraday/net_http'
    Faraday.default_adapter = :net_http

    def initialize(movie)
      @movie = movie
    end
  
    def search
        @api_key = "6acbb971452c91042d1e6a3b6d068850" #ENV['MOVIEDB_API_KEY']
        response = Faraday.get("https://api.themoviedb.org/3/search/multi?api_key=#{@api_key}&query=#{@movie}")
        return response.body
    end
  end