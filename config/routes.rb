Rails.application.routes.draw do
  root 'welcome#index'
  get '/search' => 'welcome#search'

  resources :posts do
    resources :resources, except: [:show]
  end

  resources :projects, except: [:show]
  get '/about' => 'about#index'
  get '/admin' => 'admin#auth'
  post '/admin' => 'admin#login'
  delete '/admin' => 'admin#logout'
end
