class BannersController < ApplicationController
  def index
    @publicaciones = Publicacion.all
  end

  def new
    @publicacion = Publicacion.new
    common_selectors
  end

  def create
    if Publicacion.create(permit_params)
      redirect_to publicaciones_path
    else
      common_selectors
      render :new
    end
  end

  def update
    @publicacion = Publicacion.find(params[:id])
    if @publicacion.update_attributes(permit_params)
      redirect_to publicaciones_path
    else
      common_selectors
      render :edit

    end
  end

  def destroy
    @publicacion = Publicacion.find(params[:id])
    if @publicacion.present?
      Publicacion.destroy(params[:id])
      redirect_to publicaciones_path
    end
  end

  def edit
    @publicacion = Publicacion.find(params[:id])
    common_selectors
  end


  private
  def permit_params
    params.require(:publicacion).permit(:nombre, :descripcion, :descripcion_corta, :fecha_creacion, :destacado, :image, :categoria_id, :serie, :tipo_serie)
  end

  def common_selectors
    @categorias = Categoria.all.order('id').map{|c| [c.nombre, c.id]}
  end
end