Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies
  root :to => redirect('/movies')
  get '/movies/:id/samedirectors', to: 'movies#samedirectors', as: 'same_directors_movies'
end
