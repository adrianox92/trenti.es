class Publicacion < ActiveRecord::Base
  self.table_name =  'playmobil.publicacion'

  validates :nombre, :descripcion_corta, :descripcion, :fecha_creacion, presence: true

  has_attached_file :image,
                    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                    :url => "/system/:attachment/:id/:style/:filename",
                    :styles => { :medium => "700x250>", :thumb => "100x100>" },
                    :default_url => "path to default image"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end