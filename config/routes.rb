Rails.application.routes.draw do
  devise_for :oauth_users
  resources :users do
    get :personal_information
    get :unfavorable
  end
  resources :tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
