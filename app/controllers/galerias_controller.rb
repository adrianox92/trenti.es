class GaleriasController < ApplicationController
  def new
    @categorias_playmobil = Categoria.where('seccion_id = ?', 1)
    @categorias_trenes = Categoria.where('seccion_id = ?', 2)
    @upload = Galeria.new
  end

  def create
    @upload = Galeria.create(upload_params)
    if @upload.save
      render json: { message: "success" }, :status => 200
    else
      #  you need to send an error header, otherwise Dropzone
      #  will not interpret the response as an error:
      render json: { error: @upload.errors.full_messages.join(',')}, :status => 400
    end
  end
  def library_upload
    a = 0
  end

  private
  def upload_params
    params.require(:upload).permit(:image)
  end
end