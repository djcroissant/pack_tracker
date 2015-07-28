Rails.application.routes.draw do
  get "sign_up" => "users#new", :as => "sign_up"
  resources :users

  resources :inventory_items
  resources :expeditions, only: [:index, :new, :create, :destroy]

  get 'login' => 'sessions#new', as: :login
  post'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout

  get 'packer/allocate' => 'packer#allocate', as: 'packer_allocate'
  post 'packer/allocate' => 'packer#pack_it', as: 'pack_it'
  get 'packer/practice' => 'packer#practice', as: 'packer_practice'
  get 'packer/packing_list' => 'packer#packing_list', as: 'packing_list'

  get 'expeditions/upcoming' => 'expeditions#upcoming', as: 'upcoming_expedition'
  get 'expeditions/join' => 'expeditions#join', as: 'join_expedition'
  get 'expeditions/unjoin' => 'expeditions#unjoin', as: 'unjoin_expedition'
  get 'expeditions/details' => 'expeditions#details', as: 'expedition_details'

  #get 'expeditions' => 'expeditions#index', as: 'expeditions'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'expeditions#index'

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
