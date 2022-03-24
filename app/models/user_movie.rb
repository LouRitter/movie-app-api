class UserMovie < ApplicationRecord
    belongs_to :movie, inverse_of: :user_movies
    belongs_to :user, inverse_of: :user_movies
    accepts_nested_attributes_for :movie, allow_destroy: true
    accepts_nested_attributes_for :user, allow_destroy: true
    validates :movie_id, :uniqueness => { :scope => :user_id }

end
