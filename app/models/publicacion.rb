class Publicacion < ActiveRecord::Base
  self.table_name =  'playmobil.publicacion'

  validates :nombre, :descripcion_corta, :descripcion, :fecha_creacion, presence: true

  has_attached_file :image,
                    styles: {ficha_thumb: '750x150^', resume: '125x125#'},
                    default_style: :ficha_thumb,
                    :convert_options => {#redimensiones con relleno
                                         :ficha_thumb => "-background transparent -compose Copy -gravity center -extent 750x150",
                                         :resume => "-background transparent -compose Copy -gravity center -extent 125x125"
                    },
                    url: '/blobs/:class/:attachment/:id/:style/:basename.:extension',
                    path: ':rails_root/public/blobs/:class/:attachment/:id/:style/:basename.:extension',
                    default_url: "vacio/vacio.jpg"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end