# frozen_string_literal: true

Rails.application.routes.draw do
  root 'shared#index'
  get '/search', to: 'shared#search'
  get '/feed', to: 'posts#feed'

  get '/posts/private', to: 'posts#private'
  resources :posts do
    resources :resources, except: %i[index show]
    resources :tags, except: %i[index edit update]
  end

  resources :projects, except: %i[index show] do
    resources :tags, except: %i[index edit update]
  end
  
  get '/about', to: 'about#index'
  get '/admin', to: 'admin#auth'
  post '/admin', to: 'admin#login'
  delete '/admin', to: 'admin#logout'

  resources :tags, only: [:show]
end
