class CreateUploades < ActiveRecord::Migration
  def change
    create_table :uploades do |t|

      t.timestamps null: false
    end
  end
end
