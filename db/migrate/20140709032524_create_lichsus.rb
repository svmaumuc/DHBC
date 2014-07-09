class CreateLichsus < ActiveRecord::Migration
  def change
    create_table :lichsus do |t|

      t.timestamps
    end
  end
end
