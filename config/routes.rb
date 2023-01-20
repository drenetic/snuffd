Rails.application.routes.draw do
  resources :results, only: %i[index new create show destroy] do
    resources :results_infections, only: %i[show]
    collection { get :share }
    resources :links, only: %i[] do
      member { get :create }
    end
    resources :results do
      member { get :patients }
    end
  end
  resources :links, only: %i[index]

  devise_for :users
  root to: "pages#home"
end
