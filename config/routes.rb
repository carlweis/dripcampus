Rails.application.routes.draw do

  resources :messages
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
  resources :campaigns do
    # campaign message routes
    resources :messages

    # campaign subscriber routes
    resources :subscribers, only:[:index, :show, :new, :create]
  end

end
