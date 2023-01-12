Rails.application.routes.draw do
  resources :results do
    collection { get :share }
    resources :links, only: %i[] do
      member { get :create }
    end
  end
  resources :links, only: %i[index]

  # get "/results", to: "results#index"
  # get "results/new", to: "results#new"
  # post "/results", to: "results#create"
  # get "/results/:id", to: "results#show"
  # get "/result/share", to: "results#share"
  # get "links/show"

  devise_for :users
  root to: "pages#home"
<<<<<<< HEAD

  resources :results, only: %i[index new create show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
=======
>>>>>>> master
end
