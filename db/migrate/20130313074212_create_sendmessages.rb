class CreateSendmessages < ActiveRecord::Migration
  def change
    create_table :sendmessages do |t|
      t.text :message_text
      t.integer :recipient_number
      t.integer :date
      t.integer :time
      t.integer :simcard_id
      t.string :delievery_status

      t.timestamps
    end
  end
end
