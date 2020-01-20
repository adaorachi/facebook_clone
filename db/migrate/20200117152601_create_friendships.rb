class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.integer :active_friend_id
      t.integer :passive_friend_id
      t.boolean :confirmed, default: 0

      t.timestamps
    end
    add_index :friendships, :passive_friend_id
    add_index :friendships, :active_friend_id
    add_index :friendships, [:passive_friend_id, :active_friend_id], unique: true
  end
end
