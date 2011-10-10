StaticApp::Application.routes.draw do |map|
  


  resources :users do
  
    member do
      get :following, :followers
    end
  end
 
 resources :microposts do
  get :create, :destroy
  end
 
 resources :posts do
 resources :comments
 get :create, :destroy
 end
 
 

#  map.root :controller => 'articles'
#  map.resources :articles
# Rss feedы недоделаны (в конце заняться доработкой)
  resources :searches, :only => [:new, :create, :show]
  resources :users, :only => :destroy
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy] 
  resources :posts, :only => [:create, :destroy, :show] 
  resources :comments
  resources :relationships, :only => [:create, :destroy]
  resources :password_resets
  resources :messages
  
  
  match '/blogs', :to => 'posts#blogs'
  match '/searches', :to => 'searches#index'
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  
  match '/vacancy', :to => 'pages#vacancy'
  match '/indev', :to => 'pages#indev'
  match '/reglament', :to => 'pages#reglament'
  match '/develop', :to => 'pages#develop'
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  
  
  root  :to => 'pages#home'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end