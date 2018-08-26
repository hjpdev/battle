class Game
  attr_reader :current_turn, :player1, :player2, :players
  def initialize(player1, player2)
    @players = [player1, player2]
    @player1, @player2 = player1, player2
    @current_turn = player1
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  def opponent_of(the_player)
    players.select { |player| player != the_player }.first
  end

  def loser
    losers.first
  end

  def game_over?
    losers.any?
  end

  def self.create(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.instance
    @game
  end

  private
  def losers
    players.select { |p| p.hit_points <= 0 }
  end
end