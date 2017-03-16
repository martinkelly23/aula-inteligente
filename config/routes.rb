Rails.application.routes.draw do

  resources :logros

  get 'gauchada/index'

  get '/detallesGauchada', to:'gauchada#show'

  get '/listadoLogros', to:'logros#index'

  get '/nuevoLogro', to:'logros#new'

  get '/editarLogro', to:'logros#edit'

  get '/eliminarLogro', to:'logros#destroy'


  get '/listadoIngresos', to:'ingresos#index'

  get '/nuevoIngreso', to:'ingresos#nuevoIngreso'

  get '/eliminarIngreso', to:'ingresos#destroy'

  resources :aulas

  get '/listadoAulas', to:'aulas#index'

  get '/nuevaAula', to:'aulas#new'

  get '/editarAula', to:'aulas#edit'

  get '/eliminarAula', to:'aulas#destroy'

  get '/cargarAula', to:'aulas#cargarAula'

  get '/detallesAula', to:'aulas#index2'

  get '/busquedaAula', to:'aulas#busqueda'

  resources :estadisticas

  get '/estadisticasAulas', to:'estadisticas#index'

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users, only: [:index]
  get '/nuevoUsuario', to:'users#new'

  root 'ingresos#index'
  get '/nuevoMonstruo', to:'monstruos#new'
  get '/listadoMonstruos', to:'monstruos#index'

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
