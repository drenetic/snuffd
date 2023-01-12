Rails.application.routes.draw do
  resources :results, only: %i[index new create show] do
    resources :results_infections, only: %i[show]
    collection { get :share }
    resources :links, only: %i[] do
      member { get :create }
    end
  end
  resources :links, only: %i[index]
  # resources :results_infections, only: %i[show]

  devise_for :users
  root to: "pages#home"
end
