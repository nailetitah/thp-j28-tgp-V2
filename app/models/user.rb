class User < ApplicationRecord
  belongs_to :city
  has_many :gossips, dependent: :destroy
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  #Validations
  validates :first_name, presence: true, length: { in: 1..30, 
  message: "please chose a first name between 2 and 30 caracters" }
  validates :last_name, presence: true, length: { in: 1..30, 
  message: "please chose a last name between 2 and 30 caracters" }
  validates :description, presence: true, length: { in: 1..150, 
  message: "please chose a description between 2 and 150 caracters" }
  validates :email, presence: true, uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :age, presence: true, length: { is: 2, 
  message: "please chose a correct age" }

  #Password
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
