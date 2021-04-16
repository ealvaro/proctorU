# frozen_string_literal: true

Rails.application.routes.draw do
  post '/users/:id/validate', to: 'users#validate'

  get '*path', to: 'errors#error_404', via: :all
end
