Rails.application.routes.draw do
  resources :album_songs
  resources :artist_balances
  resources :artists
  resources :songs
  resources :albums
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
