class FrontendController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @ultimas_publicaciones = Publicacion.where('destacado = ?', true).order('created_at DESC').limit(3)
    @categorias = Categoria.all
  end

  def publicaciones
   @publicaciones = Publicacion.order('created_at DESC').paginate(:page => params[:page], :per_page => 1)
   @categorias = Categoria.all
  end

  def publicacion_detalle
    @publicacion = Publicacion.find_by_url(params[:url])
    @publicaciones_relacionadas = Publicacion.where('id not IN(?) AND categoria_id = ?', @publicacion.id, @publicacion.categoria_id).limit(3)
    if @publicaciones_relacionadas.count < 1
      @publicaciones_relacionadas = Publicacion.where('id NOT IN(?)', @publicacion.id).limit(3)
    end
  end
  def about

  end
end
