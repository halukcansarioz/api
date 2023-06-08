Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace "api" do
    resources :products
    resources :categories
  end

  scope 'api'do 
    mount_devise_token_auth_for 'User', at: 'auth'
  end
  
    # Defines the root path route ("/")
  # root "articles#index"
end
