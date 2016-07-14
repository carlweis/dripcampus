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

  # Campaign routes
  get 'dashboard' => 'campaigns#index', as: 'dashboard'
  resources :campaigns
  
end
