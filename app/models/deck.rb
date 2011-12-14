class Deck < ActiveRecord::Base
	
	belongs_to :game
	has_many :card, :dependent => :destroy
	
	attr_accessor :cards
	
end
