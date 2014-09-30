Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'registrations'
  }

  get     '/companies/new'    => 'companies#new',     :as => 'new_company'
  get     '/companies/:page'  => 'companies#index',   :as => 'companies'
  post    '/companies'        => 'companies#create',  :as => 'create_company'
  get     '/company/:id/edit' => 'companies#edit',    :as => 'edit_company'
  put     '/company/:id'      => 'companies#update',  :as => 'update_company'
  delete  '/company/:id'      => 'companies#destroy', :as => 'destroy_company'

  resources :invoices

  root 'home#index'

  get  'home/index'    => 'home#index',              as: :home_index
  get  'user/company'  => 'home#new_company',        as: :new_user_company
  post 'user/company'  => 'home#create_company',     as: :create_user_company
  get  'home/edit'     => 'home#edit_company',       as: :edit_user_company
  get  'home/update'   => 'home#update_company',     as: :update_user_company

  get 'static/index' => 'static#index', as: :static_index

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
