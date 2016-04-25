Rails.application.routes.draw do

  get 'students_sessions/new'

  get 'sessions/new'

  get 'sessions/new'

  resources :educations
  resources :events
  resources :publications
  resources :research_interests
  resources :homepage
  get 'aboutus' => 'homepage#aboutus'
  get 'partnership' => 'homepage#partnership'
  get 'studentscorner' => 'homepage#studentscorner'
  
  root 'homepage#index'

  resources :faculties
  get 'login' => 'sessions#new'
  post 'login' =>'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'uin' => 'students#uin'
  get 'uin_search_results' => 'students#uin_search_results'
  get 'upload_resume' =>'faculties#upload_resume'
  resources :students
  get 'student_login' => 'students_sessions#new'
  get 'associate_student'=> 'faculties#associate_student'
  post 'student_login' => 'students_sessions#create'
  delete 'student_logout' => 'students_sessions#destroy'

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
