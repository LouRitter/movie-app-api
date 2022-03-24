class AddAdditionalFieldsToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :genre_ids, :string, null: true
    add_column :movies, :media_type, :string, null: true
    add_column :movies, :overview, :string, null: true
    add_column :movies, :poster_path, :string, null: true
    add_column :movies, :release_date, :string, null: true
    remove_column :movies, :movie_info, :json

  end
end
