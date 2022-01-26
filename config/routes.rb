Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  get '/user-movie-data', to: 'members#movies'

  get '/movies/search', to: 'movies#search'
  post '/movies/save', to: 'movies#save'

end