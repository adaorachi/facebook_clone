class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, presence: true, length: { in: 3..100 }
  validates :surname, presence: true, length: { in: 3..100 }
  validates :birthdate, presence: true
  validates :gender, presence: true
end
