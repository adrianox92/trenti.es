class GestionController < ApplicationController
  def index
    @categorias_playmobil = Categoria.where('seccion_id = ?', 1)
    @categorias_trenes = Categoria.where('seccion_id = ?', 2)
  end

  def categorias
    a = 0
  end

end