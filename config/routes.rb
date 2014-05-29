TherapyApp::Application.routes.draw do
  get "appointments/new"
  get "appointments/index"
  get "events/index"
  devise_for :therapists, :controllers => { :registrations => "registrations" }
  resources :charges, :therapists, :events
  
  devise_scope :therapist do
    match '/signup' => 'devise/registrations#new', via: 'get'
    match '/edit' => 'devise/registrations#edit', :as => :therapist_edit, via: 'get'
  end
  
  match "/chat/:id" => "chat#view", via: 'get'
  match "/new" => "chat#new", via: 'get'
  match "/chatindex" => 'index#index', via: 'get'
  
  match '/schedule' => 'events#create', :as => :create_appointment, via: 'post'
  match '/this_therapist_events' => 'events#this_therapist_events', via: 'post'
  
  constraints(:subdomain => 'therapy') do
    match '/about' => 'therapists#about', :as => :therapist_about, via: 'get'
    match '/privacy' => 'therapists#privacy', :as => :therapist_privacy, via: 'get'
    match '/terms' => 'therapists#terms', :as => :therapist_terms, via: 'get'
    match '/' => 'therapists#home', :as => :therapist_home, via: 'get'
  end
  
  match '/therapist/update' => 'therapists#signup', :as => :update_therapist, via: 'get'
  match '/therapist/create' => 'therapists#create', via: 'post'
  match '/therapist/update' => 'therapists#update', via: 'patch'
  match '/browse' => 'therapists#index', :as => :therapists_index, via: 'get'
  match '/profile' => 'therapists#show_my_profile', :as => :show_my_profile, via: 'get'
  
  match '/paysecure' => 'charges#new', via: 'get'
  
  match '/signup' => 'users#new', :as => :new_user, via: 'post'
  match '/save_c' => 'users#save_c', :as => :save_user_card, via: 'post'
  match '/update' => 'users#update', :as => :update_user, via: 'patch'
  match '/finish' => 'users#finish', :as => :finish_user, via: 'patch'
  match '/' => 'static_pages#home', :as => :homepage, via: 'get'
  match '/about' => 'static_pages#about', :as => :about, via: 'get'
  match '/privacy' => 'static_pages#privacy', :as => :privacy, via: 'get'
  match '/terms' => 'static_pages#terms', :as => :terms, via: 'get'
  
  match '/drop_email_route' => 'users#drop_email', via: 'patch' 
  
  #chat api ajax call routes
  match '/api/authenticate' => 'api#authenticate', via: 'post'
  match '/api/typing_status' => 'api#typing_status', via: 'post'
  match '/api/update_nickname' => 'api#update_nickname', via: 'post'
  match '/api/post_message' => 'api#post_message', via: 'post'
  
  match '/therapists/:id' => 'therapists#show', :as => :show_therapist, via: 'get'
  
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
