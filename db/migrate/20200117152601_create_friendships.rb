class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.integer :active_friend_id
      t.integer :passive_friend_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
