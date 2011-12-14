class CreateHands < ActiveRecord::Migration
  def self.up
    create_table :hands do |t|
      t.integer :game_id
      t.integer :player
      t.timestamps
    end
    add_column :cards, :hand_id, :integer
    add_index :hands, :player
  end
  
  def self.down
	drop_table :hands
	remove_column :cards, :hand_id
  end
end
