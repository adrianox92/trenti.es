class FrontendController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @ultimas_publicaciones = Publicacion.where('destacado = ?', true).order('created_at DESC').limit(3)
  end

  def publicaciones
   @publicaciones = Publicacion.order('created_at DESC').paginate(:page => params[:page], :per_page => 1)
  end

  def publicacion_detalle
    @publicacion = Publicacion.find_by_url(params[:url])
  end
end
