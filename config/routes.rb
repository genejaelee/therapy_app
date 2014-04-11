TherapyApp::Application.routes.draw do
  get "appointments/new"
  get "appointments/index"
  get "events/index"
  devise_for :therapists, :controllers => { :registrations => "registrations" }
  resources :charges, :therapists, :events
  
  devise_scope :therapist do
    match '/signup' => 'devise/registrations#new', :constraints => { :subdomain => 'therapy' }, via: 'get'
    match '/edit' => 'devise/registrations#edit', :constraints => { :subdomain => 'therapy' }, :as => :therapist_edit, via: 'get'
  end
  
  match '/schedule' => 'events#create', :as => :create_appointment, via: 'post'
  
  match '/update' => 'therapists#signup', :as => :update_therapist, :constraints => { :subdomain => 'therapy' }, via: 'get'
  match '/create' => 'therapists#create', :constraints => { :subdomain => 'therapy' }, via: 'post'
  match '/' => 'therapists#home', :constraints => { :subdomain => 'therapy' }, via: 'get'
  match '/update' => 'therapists#update', :constraints => { :subdomain => 'therapy' }, via: 'patch'
  match '/index' => 'therapists#index', :constraints => { :subdomain => 'therapy' }, via: 'get'
  match '/profile' => 'therapists#show_my_profile', :as => :show_my_profile, :constraints => { :subdomain => 'therapy' }, via: 'get'
  match '/therapists/:id' => 'therapists#show', :as => :show_therapist, :constraints => { :subdomain => 'therapy' }, via: 'get'
  
  match '/signup' => 'users#create', :as => :create_user, via: 'post'
  match '/charge' => 'users#charge', :as => :charge_user, via: 'post'
  match '/update' => 'users#update', :as => :update_user, via: 'patch'
  match '/finish' => 'users#finish', :as => :finish_user, via: 'patch'
  match '/' => 'static_pages#home', :as => :homepage, via: 'get'
  match '/about' => 'static_pages#about', :as => :about, via: 'get'
  match '/privacy' => 'static_pages#privacy', :as => :privacy, via: 'get'
  match '/terms' => 'static_pages#terms', :as => :terms, via: 'get'
  
  root 'static_pages#home'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
