module Libraryable
  extend ActiveSupport::Concern

  # @author Javier Pérez
  # Método que realiza la carga de los archivos a la base de datos según los elementos introducidos en el dropzone
  def library_upload
    id_padre = "#{params[:modelo].singularize}_id"

    #El orden se calcula auotmáticamente con el concern Ordenable
    fichero = Banner.create({
                                                                            image: params[:archivo]
                                                                        })

    if fichero.errors.any?
      render json: {error: fichero.errors.full_messages.join(', ')}, status: 400
    else
      render json: {file_id: fichero.id, file_model: params[:modelo], message: 'success'}, status: 200
    end
  end

  # @author Javier Pérez
  # Método para extraer los archivos de un modelo dado
  # @return [archivos] Array con los ficheros del modelo
  def library_uploaded_files
    ficheros = []

    modelo = Banner

    modelo.order(:orden).each do |fichero|
      ficheros << {name: fichero.image_file_name, size: fichero.image_file_size, path: fichero.image.url, file_id: fichero.id}
    end

    render json: ficheros
  end

  # @author Javier Pérez
  # Actualiza el orden de los archivos
  # Esta función se ejecuta al subir un nuevo archivo, al cambiar el orden y al eliminar un archivo
  def library_sort
    modelo =  Banner
    id_padre = "#{params[:modelo].singularize}_id"

    params[:ficheros].split(',').each_with_index do |id, index|
      modelo.find(id).update_attribute :orden, (index + 1)
    end

    render nothing: true
  end

  # @author Javier Pérez
  # Método que elimina el archivo al que el usuario desde el dropzone pulsó en "Borrar archivo"
  def library_destroy
    modelo = Banner

    fichero = modelo.find(params[:id])
    if fichero.destroy
      render json: {message: t(:Fichero_eliminado_correctamente)}
    else
      render json: {message: fichero.errors.full_messages.join(', ')}
    end
  end

end