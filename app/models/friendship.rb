class Friendship < ApplicationRecord
  belongs_to :passive_friend, class_name: "User"
  belongs_to :active_friend, class_name: "User"

  validates :passive_friend_id, presence: true
  validates :active_friend_id, presence: true

  validates_uniqueness_of :passive_friend_id, scope: :active_friend_id
end
