Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :results, only: %i[show] do
    resources :results_infections, only: %i[show]
  end

end
