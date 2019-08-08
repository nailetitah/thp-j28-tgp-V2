class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tag_links
  has_many :tags, through: :tag_links
  has_many :comments, dependent: :destroy

  #Validations
  validates :title, presence: true, length: { in: 1..50, 
  message: "must be between 1 and 50 caracters" }
  validates :content, presence: true, length: { in: 1..150, 
  message: "must be between 1 and 150 caracters" }

end
