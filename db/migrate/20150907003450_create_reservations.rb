class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :email
      t.text :message
      t.string :cruise_type

      t.timestamps null: false
    end
  end
end
