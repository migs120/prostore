Rails.application.routes.draw do

resources :order_checkouts
  #get 'order_checkouts/index'

  #get 'order_checkouts/show'

  #get 'order_checkouts/new'

  #get 'order_checkouts/edit'

  #get 'order_items/create'

  #get 'order_items/update'

  #get 'order_items/destroy'

  #get 'carts/show'

resources :main_categories do
  resources :main_category_pics
end
  

resources :main_categories do
  resources :items do 
    resources :item_pics
  end 
end

  

#   get 'sites/index'

#   get 'sites/show'

#   get 'sites/new'

#   get 'sites/edit'
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]  
 

  devise_for :users
   resources :users#, only: [:update]


#  get 'welcome/index'

#  get 'welcome/about'
  
  get 'about' => 'welcome#about'
  
  root to: 'main_categories#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
get "checkout", to: "items#checkout"

get "purchases", to: "order_checkouts#purchases"
get "thank_you", to: "order_checkouts#thank_you"
get "seeds", to: "order_items#seeds"
post "paypal", to: "order_checkouts#pal_purchase"
post "pal_return", to: "order_checkouts#pal_return"
  # You can have the root of your site routed with "root"
  # root 'welcome#index'
get "contact", to: "welcome#contact"
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
