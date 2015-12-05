Rails.application.routes.draw do

  
  resources :accounts, except: [:new, :edit]
  resources :messages, except: [:new, :edit]
  resources :events, except: [:new, :edit]
  resources :users, except: [:new, :edit]
  resources :friends, except: [:new, :edit]
  resources :blocked_users, path: '/blocked', except: [:new, :edit]
  
  get :token, controller: 'application'
  get :recievedMessages, controller: 'messages'
  get :mapEvents, controller: 'events'
  post 'blocked/:id', to: 'blocked_users#destroy'
  post 'events/:id/join', to: 'events#join'
  post 'events/:id/invite', to: 'events#invite'
  post 'events/:id/leave', to: 'events#leave'
  get :search, controller: 'events'
  get :uSearch, controller: 'users'
  post 'friends/:id', to: 'friends#reply', as: :friend_reply
  post 'friends/:id/remove', to: 'friends#destroy'

  
  put 'events/:id/checkin', to: 'users#checkin'
  get :expTest, controller: 'users'
  
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
