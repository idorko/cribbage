class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.string :rank
      t.string :suit
      t.integer :deck_id
    end
	add_index :cards, :deck_id
  end

  def self.down
	drop_table :cards
  end
end
