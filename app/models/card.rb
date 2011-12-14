class Card < ActiveRecord::Base
	belongs_to :deck
	belongs_to :hand	
#	attr_accessor :rank, :suit
	attr_accessible :rank, :suit	
end
