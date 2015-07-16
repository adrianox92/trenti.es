class Post < ActiveRecord::Base
  self.table_name =  'post'
  belongs_to :categoria

end