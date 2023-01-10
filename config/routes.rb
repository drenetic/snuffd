Rails.application.routes.draw do
  resources :results do
    member { get :generate_link }
  end

  get "/results", to: "results#index"
  get "results/new", to: "results#new"
  post "/results", to: "results#create"
  get "/results/:id", to: "results#show"
  get "/result/share", to: "results#share"
  get "links/show"

  devise_for :users
  root to: "pages#home"
end
