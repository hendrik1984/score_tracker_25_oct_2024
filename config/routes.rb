Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :games do
    resources :scores, only: [:index, :create, :new, :edit, :update]
  end

  root "pages#home"
end
