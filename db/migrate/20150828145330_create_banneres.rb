class CreateBanneres < ActiveRecord::Migration
  def change
    create_table :banneres do |t|

      t.timestamps null: false
    end
  end
end
