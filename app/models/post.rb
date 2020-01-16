class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { minimum: 3 }
  validates :user_id, presence: true

  default_scope -> { order(created_at: :desc) }
end
