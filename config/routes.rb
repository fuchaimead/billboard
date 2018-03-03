Rails.application.routes.draw do
root 'charts#index'
resources :charts 

put "/chart_songs", to: "charts#chart_songs", as: :chart_songs
get "/charts/:id/add_songs", to: "charts#add_songs", as: :add_songs
resources :artists do
  resources :songs
end

end

