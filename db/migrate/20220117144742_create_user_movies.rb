class CreateUserMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :user_dislikedmovies do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
