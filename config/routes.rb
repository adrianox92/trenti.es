Rails.application.routes.draw do
  get 'gestion' => 'gestion#index'

  scope '/gestion' do
    get 'categorias/:id' => 'playmobil#categorias', as: :categorias_playmobil
    get 'galerias' => 'playmobil#galerias', as: :galerias_playmobil
  end



end
