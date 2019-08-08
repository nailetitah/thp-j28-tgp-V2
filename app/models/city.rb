class City < ApplicationRecord
  has_many :users

  # Validation
  validates :name, presence: true, uniqueness: true, length: { in: 2..30 }
end
