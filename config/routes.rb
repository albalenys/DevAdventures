Rails.application.routes.draw do
  root 'shared#index'
  get '/search' => 'shared#search'

  resources :posts do
    resources :resources, except: [:index, :show]
  end

  resources :projects, except: [:index, :show]
  get '/about' => 'about#index'
  get '/admin' => 'admin#auth'
  post '/admin' => 'admin#login'
  delete '/admin' => 'admin#logout'
  get '/admin/private' => 'admin#private'
end
