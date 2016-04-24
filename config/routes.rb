Rails.application.routes.draw do
  root 'shared#index'
  get '/search', to: 'shared#search'
  get '/feed.rss', to: 'posts#feed'

  get '/posts/private' => 'posts#private'
  resources :posts do
    resources :resources, except: [:index, :show]
  end

  resources :projects, except: [:index, :show]
  get '/about', to: 'about#index'
  get '/admin', to: 'admin#auth'
  post '/admin', to: 'admin#login'
  delete '/admin', to: 'admin#logout'
end
