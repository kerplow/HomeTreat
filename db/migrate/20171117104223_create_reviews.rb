class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.references :client, foreign_key: true
      t.references :specialist, foreign_key: true

      t.timestamps
    end
  end
end
