require './dealer.rb'
class Game

  def initialize
    @dealer = Dealer.new
  end

  def start
    while (@dealer.on_game?)
      @dealer.pre_flop
      @dealer.flop
      @dealer.tern
      @dealer.river
      @dealer.showdown
    end
  end

end
