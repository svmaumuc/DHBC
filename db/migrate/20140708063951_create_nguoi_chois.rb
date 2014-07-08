class CreateNguoiChois < ActiveRecord::Migration
  def change
    create_table :nguoi_chois do |t|

      t.timestamps
    end
  end
end
