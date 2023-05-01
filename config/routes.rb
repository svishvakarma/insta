Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index', as: 'home'
  resources :posts, except: [:index]

  #profile
  get '/view/:id', to: 'profile#show', as: 'view_profile'
  get '/profile/edit', to: 'profile#edit'
  patch '/profile/update', to: 'profile#update'
  get '/view_all', to: 'profile#show_all'

  
   #likes
   post '/like/:post_id', to: 'likes#create', as: 'like'
   delete '/unlike/:post_id', to: 'likes#destroy', as: 'unlike'
end
