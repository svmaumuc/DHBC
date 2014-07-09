class CreateNguoichois < ActiveRecord::Migration
  def change
    create_table :nguoichois do |t|

      t.timestamps
    end
  end
end
