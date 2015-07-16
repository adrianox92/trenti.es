class Categoria < ActiveRecord::Base
  self.table_name =  'categoria'
  belongs_to :seccion
  has_many :posts

end