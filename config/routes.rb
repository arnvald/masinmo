Inmo::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users do
    get "sign_in", :to => "devise/sessions#new" 
    get "sign_out", :to => "devise/sessions#destroy" 
    get "sign_up", :to => "devise/registrations#new"
  end

  root :to => "main#index"

  match "search/cities" => "search#cities"
  match "search/regions" => "search#regions"

  resources :offers do 
    resources :comments, :only => [:create, :destroy]
  end

  resources :users do
    resources :offers do
      member do
        put :publish
        put :hide
      end
    end
  end
end
