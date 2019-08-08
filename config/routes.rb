Rails.application.routes.draw do
  # Pages statiques
  root 'gossips#index'
  get 'team' => 'pages#team'
  get 'contact' => 'pages#contact'
  get 'login' => 'pages#login'
  # Pages dynamiques
  resources :welcome, controller: 'welcome'
  resources :gossips, controller: 'gossips'
  resources :users, controller: 'users'
  resources :tags, controller: 'tags'
  resources :gossips do
    resources :comments
  end
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
