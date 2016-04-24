Rails.application.routes.draw do
  root 'shared#index'
  get '/search' => 'shared#search'
  get '/feed' => 'posts#feed'

  get '/posts/private' => 'posts#private'
  resources :posts do
    resources :resources, except: [:index, :show]
  end

  resources :projects, except: [:index, :show]
  get '/about' => 'about#index'
  get '/admin' => 'admin#auth'
  post '/admin' => 'admin#login'
  delete '/admin' => 'admin#logout'
end
