class Game < ActiveRecord::Base
	attr_accessible :player1_id, :player2_id, :player1_score, :player2_score
	
	has_and_belongs_to_many :user, :join_table => 'games_users'
end
