class Seccion < ActiveRecord::Base
  self.table_name =  'public.seccion'
   has_many :categorias

end