Rails.application.routes.draw do
  resources :users, only: [:show, :index]
  get '*path', to: 'errors#error_404', via: :all
end
