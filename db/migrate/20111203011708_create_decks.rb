class CreateDecks < ActiveRecord::Migration
  def self.up
    create_table :decks do |t|
      t.integer :game_id
    end
  add_index :decks, :game_id
  end
 
  def self.down
    drop_table :decks
  end
end
