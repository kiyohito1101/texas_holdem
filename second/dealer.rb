require './player.rb'
require './cards_deck.rb'
class Dealer

  def initialize
    @my_player = Player.new
    @pc_player = Player.new
    @table_deck = CardsDeck.new
    @table_deck.deck_shuffle
    @open_cards = Array.new
    @pot_chip = 0
  end

  def pre_flop
    self.ante
    4.times do |i|
      if (i % 2) == 0
        @my_player.play_deck.cards << @table_deck.cards.shift
      else
        @pc_player.play_deck.cards << @table_deck.cards.shift
      end
    end
    print "---------------PreFlop---------------\n",
          "                         pc_chips [",
          @pc_player.chip,"]\n\n","               pot [",
          @pot_chip,"]\n\n","my_chips [",@my_player.chip,"] "

    @my_player.play_deck.cards.each do |x|
      print @my_player.play_deck.cards_show(x)," "
    end
    print "\n-------------------------------------"
    self.tactics
  end

  def flop
  end

  def tern
  end

  def river
  end

  def showdown
    self.table_reset
  end

  def on_game?
    unless (@my_player.chip <= 0) || (@pc_player.chip <= 0)
      true
    else
      false
    end
  end

  def ante
    @pot_chip += 50 * 2
    @my_player.chip -= 50
    @pc_player.chip -= 50
  end

  def tactics
    my_pot = 0
    pc_pot = 0
    if @open_cards == []
      @pc_player.offensive = @pc_player.play_deck.hand_check
    else

    end

    print "\nc:Check b:Bet(50) r:Raise(150) f:Fold\n"
    @my_player.input_key(50)
    @my_player.pot_in(my_pot,pc_pot)
    @pc_player.pc_input_key(150)
  end

  def table_reset
    @table_deck = CardsDeck.new
    @table_deck.deck_shuffle
    @open_cards = Array.new
    @my_player.play_deck = CardsDeck.new
    @pc_player.play_deck = CardsDeck.new
  end

end
