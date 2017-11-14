class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :location
      t.string :status
      t.references :client, foreign_key: true, index: true
      t.references :treatment, foreign_key: true, index: true

      t.timestamps
    end
  end
end
