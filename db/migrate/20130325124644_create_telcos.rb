class CreateTelcos < ActiveRecord::Migration
  def change
    create_table :telcos do |t|
      t.string :telco

      t.timestamps
    end
  end
end
