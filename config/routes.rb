Rails.application.routes.draw do
root 'charts#index'

resources :charts do 
  resources :songs
end

scope 'songs/:song_id', as: 'song' do
  resources :artists
end


end
