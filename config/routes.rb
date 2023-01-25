Rails.application.routes.draw do
  resources :results, only: %i[index new create show destroy] do
    resources :results_infections, only: %i[show]
    member { get :confirmation }
    collection { get :share }
    resources :links, only: %i[] do
      collection { get :create }
    end
  end

  resources :links, only: %i[index]
  resources :results_infections, only: %i[ new create]

  get '/results/patient/:patient_id', to: 'results#patient', as: 'results_patient'

  devise_for :users
  root to: "pages#home"
end
