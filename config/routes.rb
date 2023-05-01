Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index', as: 'home'
  resources :posts, except: [:index]
  resources :comments, only: [:create, :destroy, :show]
  #profile
  get '/view/:id', to: 'profile#show', as: 'view_profile'
  get '/profile/edit', to: 'profile#edit'
  patch '/profile/update', to: 'profile#update'
  get '/view_all', to: 'profile#show_all'


   #likes
   post '/like/:post_id', to: 'likes#create', as: 'like'
   delete '/unlike/:post_id', to: 'likes#destroy', as: 'unlike'

  #followings
  get '/follows/:id', to: 'follows#show', as: 'follows'
  post '/follow/:id', to: 'follows#create', as: 'follow'
  delete '/unfollow/:id', to: 'follows#destroy', as: 'unfollow'
end
