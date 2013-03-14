class CreateReceivemessages < ActiveRecord::Migration
  def change
    create_table :receivemessages do |t|
      t.integer :simcard_id
      t.string :sendmessage_id
      t.integer :senders_number
      t.text :message
      t.integer :date
      t.integer :time

      t.timestamps
    end
  end
end
