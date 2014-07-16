Rails.application.routes.draw do
  #resources :login
  get 'login/index' => 'login#index', as: :login
  get 'logout', to: 'login#destroy', as: :logout
  post 'login/register' => 'login#register', via: [:get, :post], as: :register
  post 'login/logging' => 'login#logging', via: [:get, :post], as: :logging

  get 'auth/:provider/callback', to: 'login#create'


  get 'home/index'

  get 'play/index'  => 'play#index', as: :play
  get 'play/check' => 'play#check', as: :playcheck
  get 'play/end'  => 'play#end', as: :end

  match 'play/idea' => 'play#idea', via: [:get, :post], as: :playidea

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'

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
