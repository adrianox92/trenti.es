class BannersController < ApplicationController


  # Módulo para gestionar las librerías / galerías de ficheros
  include Libraryable
  def index
    @banner = Banner.all
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.create(banner_params)
    if @banner.save
      # send success header
      render json: { message: "success", fileID: @banner.id }, :status => 200
    else
      #  you need to send an error header, otherwise Dropzone
      #  will not interpret the response as an error:
      render json: { error: @banner.errors.full_messages.join(',')}, :status => 400
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    if @banner.destroy
      render json: { message: "File deleted from server" }
    else
      render json: { message: @banner.errors.full_messages.join(',') }
    end
  end

  private
  def banner_params
    params.require(:banner).permit(:image)
  end
end
