class CreateTheloais < ActiveRecord::Migration
  def change
    create_table :theloais do |t|

      t.timestamps
    end
  end
end
