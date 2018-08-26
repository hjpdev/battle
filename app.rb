require 'sinatra/base'
require './lib/game.rb'
require './lib/player.rb'
require './lib/attack.rb'

class Battle < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = Player.new(params[:player1_name])
    player2 = Player.new(params[:player2_name])
    @game = Game.create(player1, player2)
    redirect('/play')
  end

  get '/play' do
    @game = Game.instance
    @game.players.each { |p| p.reset_hp } if !!@game.loser
    erb(:play)
  end

  post '/attack' do
    @game = Game.instance
    Attack.new.attack(@game.opponent_of(@game.current_turn))
    if @game.game_over?
      redirect('/game_over')
    else
      redirect('/attack')
    end
  end

  post '/weak_attack' do
    @game = Game.instance
    Attack.new.weak_attack(@game.opponent_of(@game.current_turn))
    if @game.game_over?
      redirect('/game_over')
    else
      redirect('/attack')
    end
  end

  post '/heavy_attack' do
    @game = Game.instance
    Attack.new.heavy_attack(@game.opponent_of(@game.current_turn))
    if @game.game_over?
      redirect('/game_over')
    else
      redirect('/attack')
    end
  end

  get '/attack' do
    @game = Game.instance
    erb(:attack)
  end

  post '/switch_turns' do
    @game = Game.instance
    @game.switch_turns
    redirect('/play')
  end

  get '/game_over' do
    @game = Game.instance
    erb(:game_over)
  end
end