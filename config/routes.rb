Inmo::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users do
    get "sign_in", :to => "devise/sessions#new" 
    get "sign_out", :to => "devise/sessions#destroy" 
    get "sign_up", :to => "devise/registrations#new"
  end

  root :to => "main#index"

  resources :offers

  resources :users do
    resources :offers do
      member do
        put :publish
        put :hide
      end
    end
  end
end
