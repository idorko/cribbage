class AddUsersToGames < ActiveRecord::Migration

  def self.up
	create_table :games_users, :id => false do |t|
		t.integer :user_id
		t.integer :game_id
	end
	add_index(:games_users, [:game_id, :user_id])
  end

  def self.down
	drop_table :games_users
  end
end
