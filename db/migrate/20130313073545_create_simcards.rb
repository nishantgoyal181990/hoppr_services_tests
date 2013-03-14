class CreateSimcards < ActiveRecord::Migration
  def change
    create_table :simcards do |t|
      t.string :operator
      t.integer :simid
      t.integer :phone_number

      t.timestamps
    end
  end
end
