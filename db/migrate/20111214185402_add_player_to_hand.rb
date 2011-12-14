class AddPlayerToHand < ActiveRecord::Migration
  def self.up
	add_column :hands, :player, :integer
  end

  def self.down
	remove_column :hands, :player
  end
end
