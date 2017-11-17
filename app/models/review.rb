class Review < ApplicationRecord
  belongs_to :client
  belongs_to :specialist

  validates :title, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :client, presence: true
  validates :specialist, presence: true
end
