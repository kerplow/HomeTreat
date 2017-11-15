class AddInfoToSpecialist < ActiveRecord::Migration[5.0]
  def change
    change_table :specialists do |t|
      t.text :bio
      t.string :address
      t.integer :rating
      t.string :phone_number
    end
  end
end
