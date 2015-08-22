Rails.application.routes.draw do
  get 'galerias/new'
  post 'library_upload' => 'galerias#library_upload'

  get 'gestion' => 'gestion#index'

  scope '/gestion' do
    resources :publicaciones
    resources :categorias
  end



  root 'frontend#index'
end
