class AddPhotoToSpecialist < ActiveRecord::Migration[5.0]
  def change
    add_column :specialists, :photo, :string
  end
end
