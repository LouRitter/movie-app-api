class AddFieldsToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :title, :string
    add_column :movies, :movie_info, :json, default: {}

  end
end
