class Review < ApplicationRecord
  belongs_to :client
  belongs_to :specialist
end
