class AddReferencesToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_reference :profiles, :user, foreign_key: true, null: false
  end
end
