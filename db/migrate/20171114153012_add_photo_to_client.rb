class AddPhotoToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :photo, :string
  end
end
