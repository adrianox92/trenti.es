class CategoriasController < ApplicationController
  def index
    @categorias = Categoria.all
  end

  def new
    @categoria = Categoria.new
  end

  def create
    params[:publicacion][:url] = "#{params[:publicacion][:nombre].parameterize}"
    publicacion = Categoria.create(permit_params)

    if publicacion.valid?
      redirect_to publicaciones_path
    else
      render :new
    end
  end

  def update
    params[:publicacion][:url] = "#{params[:publicacion][:nombre].parameterize}"
    @categoria = Categoria.find(params[:id])
    if @categoria.update_attributes(permit_params)
      redirect_to publicaciones_path
    else
      render :edit

    end
  end

  def destroy
    @categoria = Categoria.find(params[:id])
    if @categoria.present?
      Categoria.destroy(params[:id])
      redirect_to publicaciones_path
    end
  end

  def edit
    @categoria = Categoria.find(params[:id])
  end


  private
  def permit_params
    params.require(:categoria).permit(:nombre)
  end

end