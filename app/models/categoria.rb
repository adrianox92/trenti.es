class Categoria < ActiveRecord::Base
  self.table_name =  'playmobil.categoria'

  has_attached_file :image,
                    styles: {ficha_thumb: '750x150^', resume: '140x140^'},
                    default_style: :resume,
                    url: '/blobs/:class/:attachment/:id/:style/:basename.:extension',
                    path: ':rails_root/public/blobs/:class/:attachment/:id/:style/:basename.:extension',
                    default_url: "/assets/usuarios/vacio.jpg"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end