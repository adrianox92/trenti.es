Rails.application.routes.draw do
  get 'galerias/new'
  post 'library_upload' => 'galerias#library_upload'

  get 'gestion' => 'gestion#index'

  scope '/gestion' do
    get 'categorias/:id' => 'playmobil#categorias', as: :categorias_playmobil
    get 'galerias' => 'playmobil#galerias', as: :galerias_playmobil
  end

  resources :galerias

  root 'frontend#index'
end
