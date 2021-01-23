class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :roomname, null: false
      t.text :description
      t.integer :fee, null: false
      t.string :address, null: false
      t.string :image, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
