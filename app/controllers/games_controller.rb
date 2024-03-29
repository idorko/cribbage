class GamesController < ApplicationController

  before_filter :authenticate
  before_filter :correct_player?, :only => [:show, :edit, :update, :destroy] 
  # GET /games
  # GET /games.json
  def index
  end

  # GET /games/1
  # GET /games/1.json
  def show
	@game = Game.find(params[:id])
	@title = "Game"
  end

  # GET /games/new
  # GET /games/new.json
  def new
	@game = Game.new
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
	#create game and setup associations for each player,
	ranks = %w(2 3 4 5 6 7 8 9 10 J Q K A)
	suits = %w(Spade Heart Club Diamond)

    	@game = current_user.game.create(params[:game])
		if @game
			@user = User.find(@game.player2_id)
			@user.game<<@game
		   	
			#create deck and cards
			@deck = @game.create_deck
			for i in (1..52)
				@card = @deck.card.create(attributes={:rank => ranks[i%13], :suit => suits[i%4]})
			end
			
			#set up initial game parameters
			@game.game_phase = "start"
			@game.whos_turn = current_user.id
			@game.player1_score = 0
			@game.player2_score = 0
			@game.hand.create(attributes={:player => 1})
			@game.hand.create(attributes={:player => 2})
			@game.save
			flash[:success] = "Game started!"
			redirect_to @game
		else 
			flash[:error] = "Error starting game."
			redirect_to current_user
 		end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    end
  end



  private

	def correct_player?
		@game = Game.find(params[:id])
		redirect_to(current_user) unless game_player?(@game)
	end

	def game_player?(game)
		(game.player1_id == current_user.id) || (game.player2_id == current_user.id)
	end
	

