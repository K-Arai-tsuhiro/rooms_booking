class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :start_at
      t.date :end_at
      t.integer :persons
      t.references :user, foreign_key: true, null: false
      t.references :room, foreign_key: true, null: false

      t.timestamps
    end
  end
end
