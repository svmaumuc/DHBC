class CreateCauhois < ActiveRecord::Migration
  def change
    create_table :cauhois do |t|

      t.timestamps
    end
  end
end
