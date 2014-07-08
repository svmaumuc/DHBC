class CreateHinhAnhs < ActiveRecord::Migration
  def change
    create_table :hinh_anhs do |t|

      t.timestamps
    end
  end
end
