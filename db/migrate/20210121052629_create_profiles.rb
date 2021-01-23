class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :introduction
      t.string :profile_photo

      t.timestamps
    end
  end
end
