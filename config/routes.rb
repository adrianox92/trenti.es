Rails.application.routes.draw do
  get 'gestion' => 'gestion#index'


  namespace :gestion do
    resources :playmobil do
      collection do
        get 'post' => 'playmobil#index', as: :post_playmobil
        get 'galerias' => 'playmobil#galerias', as: :galerias_playmobil
      end
    end
  end


end
