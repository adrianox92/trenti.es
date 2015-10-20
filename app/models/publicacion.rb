class Publicacion < ActiveRecord::Base
  self.table_name =  'playmobil.publicacion'

  validates :nombre, :descripcion_corta, :descripcion, :fecha_creacion, presence: true

  has_attached_file :image,
                    styles: {home: '750x562^', publicacion: '1140x875^'},
                    default_style: :home,
                    :convert_options => {#redimensiones con relleno
                                         :home => "-background transparent -compose Copy -gravity center -extent 750x562",
                                         :publicacion => "-background transparent -compose Copy -gravity center -extent 1140x875"
                    },
                    url: '/blobs/:class/:attachment/:id/:style/:basename.:extension',
                    path: ':rails_root/public/blobs/:class/:attachment/:id/:style/:basename.:extension',
                    default_url: "vacio/vacio.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end