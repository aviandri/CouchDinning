CouchDinning::Application.routes.draw do
  resources :orders

  devise_for :users

  resources :items, :only => [:new, :create, :edit, :update]

  resources :vendors do 
    resources :items, :only => [:index, :show, :destroy]
  end
  
  resources :tokens,:only => [:create, :destroy]
  
  namespace :api do
    resources :vendors, :only => [:index, :show] do
      resources :items, :only => [:index, :show]
    end
  end
  
end
