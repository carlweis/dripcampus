Rails.application.routes.draw do
  # devise routes
  devise_for :users, path: 'account', path_names: {
    sign_in:      'login',
    sign_out:     'logout',
    password:     'password',
    confirmation: 'verification',
    unlock:       'unblock',
    sign_up:      'register'
  }

  # default route
  root 'pages#home'

  # static page routes
  get 'tour' => 'pages#tour'

  # User account routes
  namespace :account do
    get 'dashboard' => 'dashboard#index', as: 'dashboard'
    get 'prospects' => 'prospects#index', as: 'prospects'
    get 'prospects/:id' => 'prospects#show', as: 'prospect'
  end

end
