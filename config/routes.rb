Rails.application.routes.draw do
  root 'post#index'
  
  
  get 'tweets/index'
  
  get 'tweets/new'
  
  # get 'tweets', to: 'tweets#index'

  post 'tweets', to: 'tweets#create'

  get 'tweets/show'

  get 'tweets/:id/edit' => 'tweets#edit'

  put 'tweets/:id' => 'tweets#update'

  delete 'tweets/:id' => 'tweets#destroy'

  resources :blogs
  
  
  
  
  get 'user/index'

  get 'user/new'

  post 'user/create'

  get 'user/show/:id' =>'user#show'
  
  get 'user/login'
  
  post 'user/login_process' => 'user#login_process'
  
  get 'user/logout'
  
  get 'user/note'

  get 'post/index'

  get 'post/new'

  post 'post/create'
  
  post 'post/create_comment'

  get 'post/show/:id' => 'post#show'
  
  get 'post/destroy/:id' => 'post#destroy'
  
  get 'post/edit/:id' => 'post#edit'
  
  post 'post/update/:id' => 'post#update'

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
