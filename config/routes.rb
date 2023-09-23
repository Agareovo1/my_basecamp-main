Rails.application.routes.draw do
  resources :projects
  ActiveAdmin.routes(self)
  devise_for :users
  root 'pages#home'

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
