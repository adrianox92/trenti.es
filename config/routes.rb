Rails.application.routes.draw do
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

  root 'frontend#index'
end
