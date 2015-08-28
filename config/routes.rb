Rails.application.routes.draw do
  get 'banners/new'

  get 'galerias/new'
  post 'library_upload' => 'galerias#library_upload'

  get 'gestion' => 'gestion#index'

  scope '/gestion' do
    resources :publicaciones
    resources :categorias
    resources :banners
  end
  get 'publicaciones' => 'frontend#publicaciones', as: :publicaciones_frontend
  get ':url' => 'frontend#publicacion_detalle', as: :publicacion_detalle

  #Gestión de las librerías *******************************************************************************************
  post 'library_upload(/:id/:modelo)' => 'banners#library_upload'
  get 'library_uploaded_files(/:id/:modelo)' => 'banners#library_uploaded_files'
  delete 'library_destroy(/:id/:modelo)' => 'banners#library_destroy'
  post 'library_sort(/:id/:modelo)' => 'banners#library_sort'
  root 'frontend#index'

end
