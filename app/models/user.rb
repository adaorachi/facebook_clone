class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :like_posts, foreign_key: 'user_id', dependent: :destroy
  has_many :liked_posts, through: :like_posts, source: :post

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, presence: true, length: { in: 3..100 }
  validates :surname, presence: true, length: { in: 3..100 }
  validates :birthdate, presence: true
  validates :gender, presence: true

  def like(post)
    liked_posts << post
  end

  def unlike(post)
    liked_posts.delete(post)
  end

  def liked?(post)
    liked_posts.include?(post)
  end

  def name
    "#{firstname} #{surname}"
  end
end
