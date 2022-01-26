class User < ApplicationRecord

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
         validates :username, uniqueness: true
  has_many :user_movies
  has_many :movies, through: :user_movies
  has_many :user_dislikedmovies
  has_many :dislike_movies, through: :user_dislikedmovies, source: :movie, class_name: "Movie"

end