# frozen_string_literal: true

Rails.application.routes.draw do
  root 'shared#index'
  get '/search', to: 'shared#search'
  get '/feed', to: 'posts#feed'

  get '/posts/private', to: 'posts#private'
  get '/posts/edit_title/:id', to: 'posts#edit_title', as: 'posts_edit_title'
  resources :posts do
    resources :resources, except: %i[index show]
    resources :tags, except: %i[:index]
  end

  resources :projects, except: %i[index show]
  get '/about', to: 'about#index'
  get '/admin', to: 'admin#auth'
  post '/admin', to: 'admin#login'
  delete '/admin', to: 'admin#logout'

  resources :tags, except: [:index]
end
