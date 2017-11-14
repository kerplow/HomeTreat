class AddSubcategoryToTreatment < ActiveRecord::Migration[5.0]
  def change
    add_reference :treatments, :subcategory, foreign_key: true
  end
end
