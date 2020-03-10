Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :tickets do
    member do
      get :update_status
    end
    resources :comments, except: [:edit, :update, :new]
  end
  get "/closed_tickets" => "tickets#closed_tickets"
end
