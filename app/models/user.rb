class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :like_posts, foreign_key: 'user_id', dependent: :destroy
  has_many :liked_posts, through: :like_posts, source: :post

  has_many :active_friendships, class_name: "Friendship", foreign_key: 'passive_friend_id', dependent: :destroy
  has_many :passive_friendships, class_name: "Friendship", foreign_key: 'active_friend_id', dependent: :destroy

  has_many :active_friends, through: :active_friendships
  has_many :passive_friends, through: :passive_friendships


  devise :omniauthable, omniauth_providers: %i[facebook]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, presence: true, length: { in: 3..100 }
  validates :surname, presence: true, length: { in: 3..100 }
  validates :birthdate, presence: { message: "(Date of Birth) must be entered" } 
  validates :gender, presence: { message: "must be selected" } 

  def name
    "#{firstname} #{surname}"
  end

  def self.user_birthdate(b_date)
    date = b_date.split('/')
    date = "#{date[2]}-#{date[0]}-#{date[1]}"
    date
  end

  def like(post)
    liked_posts << post
  end

  def unlike(post)
    liked_posts.delete(post)
  end

  def liked?(post)
    liked_posts.include?(post)
  end
  
  def friends
    friends_array = active_friendships.map { |friendship| friendship.active_friend if friendship.confirmed }
    friends_array.compact
  end

  def friends_and_requests_id
   all_rel_ids = active_friends.ids.concat(passive_friends.ids)
   all_rel_ids.compact
  end

  def pending_requests_to_users
    active_friendships.map { |friendship| friendship.active_friend if !friendship.confirmed }.compact
  end

  def pending_requests_from_users
    passive_friendships.map { |friendship| friendship.passive_friend if !friendship.confirmed }.compact
  end

  def send_request(user)
    active_friends << user
  end

  def friend?(user)
    friends.include?(user)
  end

  def create_reciprocal_friendship(friend_id)
    friendship1 = passive_friendships.find { |friendship| friendship.passive_friend_id == friend_id }
    friendship1.update_attributes(confirmed: true)
    friendship2 = active_friendships.build(active_friend_id: friend_id, confirmed: true)
    friendship2.save
  end

  def destroy_reciprocal_friendship(friendship1, friend_id)
    friendship1.destroy
    friendship2 = passive_friendships.find { |friendship| friendship.passive_friend_id == friend_id }
    friendship2.destroy
  end

  scope :not_friends, ->(current_user) { where.not(id: current_user.friends_and_requests_id).where('id != ?', current_user) }



  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.firstname = auth.info.first_name
    user.surname = auth.info.last_name
    user.gender = auth.extra.raw_info.gender
    user.birthdate = user_birthdate(auth.extra.raw_info.birthday)
    user.image = auth.info.image
  end
end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
