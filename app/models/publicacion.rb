class Publicacion < ActiveRecord::Base
  self.table_name =  'playmobil.publicacion'

  validates :nombre, :descripcion_corta, :descripcion, :fecha_creacion, presence: true
end