class Hand < ActiveRecord::Base
	has_many :card
	belongs_to :game
	attr_accessible :player
end
