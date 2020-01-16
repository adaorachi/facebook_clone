class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :body, presence: true, length: { minimum: 3 }
  validates :user_id, presence: true

  default_scope -> { order(created_at: :desc) }
end
