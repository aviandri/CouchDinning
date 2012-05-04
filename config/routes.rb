CouchDinning::Application.routes.draw do

  devise_for :users, :controller => {:registration => "api/users"} do
    post '/api/users', :to => 'api/users#create'
  end

  resources :items, :only => [:new, :create, :edit, :update]

  resources :vendors do 
    resources :items, :only => [:index, :show, :destroy]
  end
  
  get "/vendors/list", :to => "vendors#list"

  resources :tokens,:only => [:create, :destroy]
  
  namespace :api do
    resources :vendors, :only => [:index, :show] do
      resources :items, :only => [:index, :show]
    end
    resources :addresses, :only => [:create, :index, :show]
    
    resources :orders, :only => [:create, :index, :show]
    
    post "/users/login", :to => "users#login"

    post "/orders/checkout", :to => "orders#checkout"
  end
  
    
  root :to => 'vendors#list'
end
