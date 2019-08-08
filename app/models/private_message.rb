class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  # Validation
  validates :content, presence: true, length: { in: 1..150, 
  message: "please write a message between 1 and 150 caracters" }
end
