class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.string :game_phase
      t.integer :whos_turn
      t.string :player1_hand
      t.string :player2_hand
      t.string :crib
      t.integer :player1_score
      t.integer :player2_score
      t.string :cut
      t.string :player1_cards_played
      t.string :player2_cards_played
      t.integer :whos_crib
      
      t.timestamps
    end
	add_index :games, [:player1_id, :player2_id]
  end

  def self.down
	drop_table :game
  end
end
