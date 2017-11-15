class CreateTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :treatments do |t|
      t.string :description
      t.integer :price
      t.integer :duration
      t.references :specialist, foreign_key: true, index: true
      t.string :segment

      t.timestamps
    end
  end
end
