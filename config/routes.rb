Rails.application.routes.draw do
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
  root 'static_pages#index'
  get 'about' => 'static_pages#about'
  get 'resume' => 'static_pages#resume'
  get 'my-goals' => 'static_pages#goals'
  get 'learning-outside-the-classroom' => 'static_pages#learning_outside_classroom'
  get 'classes' => 'project_groups#index'
  resources :project_groups
  delete 'classes' => 'project_groups#destroy'
  resources :project_groups do
   resources :projects, shallow: true
  end
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  scope '/blog' do
    resources :posts
  end
  get 'blog' => 'posts#index'
  resources :posts do
    resources :comments
  end
  namespace :api do
    namespace :v1 do
      resources :project_groups, only: [:index, :show]
      resources :projects, only: [:show]
    end
  end
end
