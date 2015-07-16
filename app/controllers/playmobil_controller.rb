class PlaymobilController < GestionController
  def index

  end
  def galerias
    a = 0
  end
  def categorias
    @categorias_playmobil = Categoria.where('seccion_id = ?', 1)
    @categorias_trenes = Categoria.where('seccion_id = ?', 2)
    @post = Post.where('categoria_id = ?', params[:id])
  end
end