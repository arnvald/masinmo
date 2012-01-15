Inmo::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users do
    get "sign_in", :to => "devise/sessions#new" 
    get "sign_out", :to => "devise/sessions#destroy" 
    get "sign_up", :to => "devise/registrations#new"
  end

  root :to => "offers#index"

  match "search/cities" => "search#cities"
  match "search/regions" => "search#regions"
  match "search/price_ranges" => "search#price_ranges"

  resources :offers do 
    resources :comments, :only => [:create, :destroy]
    member do
      put :publish
      put :hide
    end
  end

  resources :favorites, :only => [:index, :create, :destroy]

  resources :users do
    resources :offers
  end
end
