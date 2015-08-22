class PublicacionesController < ApplicationController
  def index
    @publicaciones = Publicacion.all
  end

  def new
    @publicacion = Publicacion.new
  end

  def create
    @publicacion = Publicacion.create(permit_params)
    if @publicacion.save
      redirect_to publicaciones_path
    else
      render :new
    end
  end

  def update
    @publicacion = Publicacion.find(params[:id])
    if @publicacion.update_attributes(permit_params)
      redirect_to publicaciones_path
    else
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
  end


  private
  def permit_params
    params.require(:publicacion).permit(:nombre, :descripcion, :descripcion_corta, :fecha_creacion, :destacado, :image)
  end
end