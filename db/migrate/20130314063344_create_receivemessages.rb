class CreateReceivemessages < ActiveRecord::Migration
  def change
    create_table :receivemessages do |t|
      t.integer :simcard_id
      t.string :sendmessage_id
      t.string :sender
      t.text :message
      t.datetime :date
      t.datetime :time

      t.timestamps
    end
  end
end
