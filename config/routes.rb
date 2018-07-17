Rails.application.routes.draw do
  get 'braintree/new'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create, :edit, :update] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :listings do
    resource :reservations, only: [:create, :edit, :new]
  end

  resources :reservations, only: [:show, :edit, :update, :delete]

  root 'welcome#index'
  post "/search" => "listings#search", as: "search"
  get "/search" =>"listings#search", as: "search_show"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  patch "/listing/:id/verification" => "listings#verification", as: "verification"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
