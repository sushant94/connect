Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
    devise_for :users
    root "application#home"
    post 'post/create' => 'posts#create'
    post 'post/create_live' => 'posts#create_live'
    get 'post/new' => 'posts#new'
    get 'post/success' => 'posts#success'
    get 'post/fail' => 'posts#fail'
    get 'post/dashboard' => 'posts#dashboard'
    get 'post/show' => 'posts#show'
    get 'post/edit' => 'posts#edit'
    patch 'post/update' => 'posts#update'
    get 'post/destroy' => 'posts#destroy'
    get 'post/live_news' => 'posts#live_news'
    get 'post/edit_live' => 'posts#edit_live'
    patch 'post/update_live' => 'posts#update_live'

    get '/api/list' => 'api#list'
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