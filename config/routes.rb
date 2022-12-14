# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'movies#index'

  get 'filter', to: 'filter#index'
end
