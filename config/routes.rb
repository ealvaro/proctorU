# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: [:index]
  post '/users/:id/validate', to: 'users#validate'
  post '/users/validate', to: 'users#validate'

  get '*path', to: 'errors#error_404', via: :all
end
