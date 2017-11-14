class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :treatments
  validates :name, presence: true, uniqueness: true
end
