class Banner < ActiveRecord::Base
  self.table_name =  'playmobil.banner'
  has_attached_file :image,
                    styles: {ficha_thumb: '750x150^', resume: '125x125#'},
                    default_style: :ficha_thumb,
                    url: '/blobs/:class/:attachment/:id/:style/:basename.:extension',
                    path: ':rails_root/public/blobs/:class/:attachment/:id/:style/:basename.:extension',
                    default_url: "/assets/usuarios/vacio.jpg"
  validates_attachment 	:image,
                        :presence => true,
                        default_url: "vacio/vacio.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
