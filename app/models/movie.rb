class Movie < ApplicationRecord
    has_many :user_movies
    has_many :users, through: :user_movies
    has_many :user_dislikedmovies
    has_many :dislike_users, through: :user_dislikedmovies, source: :user, class_name: "User"
end
