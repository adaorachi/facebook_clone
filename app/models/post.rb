class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :like_posts, foreign_key: 'post_id', dependent: :destroy
  has_many :liked_by_users, through: :like_posts, source: :user

  validates :body, presence: true, length: { minimum: 3 }
  validates :user_id, presence: true

  default_scope -> { order(created_at: :desc) }
end
