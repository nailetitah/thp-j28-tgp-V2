class Tag < ApplicationRecord
  has_many :tag_links
  has_many :gossips, through: :tag_links

  # Validation
  validates :title, presence: true, length: { in: 1..30, 
  message: "please write a tag title between 1 and 30 caracters" }
end
