class Game < ActiveRecord::Base
	attr_accessible :player1_id, :player2_id, :player1_score, :player2_score
	
	has_and_belongs_to_many :user, :join_table => 'games_users'
	has_one :deck
	has_many :hand
	

 def shuffle
	deck.card.shuffle
 end

 def deal
	@player1_hand = hand.find_by_player(1)
	@player2_hand = hand.find_by_player(2)
	for i in (1..12)
		
		if (i%2==0)
			@player1_hand.card.push(deck.card.pop)
		else
			@player2_hand.card.push(deck.card.pop)
		end
	end
	@player1_hand.save
	@player2_hand.save
	
  end
end
