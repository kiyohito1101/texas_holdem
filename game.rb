require './card_deck'

class Game
  attr_accessor :check
  attr_reader :my_chips, :my_deck, :pc_chips

  def initialize
    @cards = CardDeck.new
    @cards.deck_shuffle
    @my_chips = 2000
    @pc_chips = 2000
    @pot = 0
    @ante = 50
    @bet = 50
    @raise = 150
    @my_hand = 0
    @pc_hand = 0
    @check = String.new
    @my_deck = CardDeck.new
    @pc_deck = CardDeck.new
    @open_deck = CardDeck.new
  end

  def pre_flop
    4.times do |i|
      if (i % 2) == 0
        @my_deck.deck << @cards.deck.shift
      else
        @pc_deck.deck << @cards.deck.shift
      end
    end
    @my_deck.check_high_card(@my_deck.deck)
    @pc_deck.check_high_card(@pc_deck.deck)

    @pot = @ante * 2
    @my_chips -= @ante
    @pc_chips -= @ante
    print "---------------PreFlop---------------\n",
          "                         pc_chips [",
          @pc_chips,"]\n\n","               pot [",
          @pot,"]\n\n","my_chips [",@my_chips,"] "

    @my_deck.deck.each do |x|
      print @my_deck.deck_show(x)," "
    end
    print "\n-------------------------------------"
  end

  def flop
    3.times do
      @open_deck.deck << @cards.deck.shift
    end
    print "---------------Flop---------------\n",
          "                         pc_chips [",
          @pc_chips,"]\n\n"

    @open_deck.deck.each do |x|
      print @open_deck.deck_show(x)," "
    end
    print "pot [",@pot,"]\n\n","my_chips [",@my_chips,"] "

    @my_deck.deck.each do |x|
      print @my_deck.deck_show(x)," "
    end
    print "\n-------------------------------------"
  end

  def tern
    @open_deck.deck << @cards.deck.shift
    print "---------------Tern---------------\n",
          "                         pc_chips [",
          @pc_chips,"]\n\n"

    @open_deck.deck.each do |x|
      print @open_deck.deck_show(x)," "
    end
    print "pot [",@pot,"]\n\n","my_chips [",@my_chips,"] "

    @my_deck.deck.each do |x|
      print @my_deck.deck_show(x)," "
    end
    print "\n-------------------------------------"
  end

  def river
    @open_deck.deck << @cards.deck.shift
    print "---------------River---------------\n",
          "                         pc_chips [",
          @pc_chips,"]\n\n"

    @open_deck.deck.each do |x|
      print @open_deck.deck_show(x)," "
    end
    print "pot [",@pot,"]\n\n","my_chips [",@my_chips,"] "

    @my_deck.deck.each do |x|
      print @my_deck.deck_show(x)," "
    end
    print "\n-------------------------------------"
  end

  def showdown
    print "---------------Showdown---------------\n","               "

    @pc_deck.deck.each do |x|
      print @pc_deck.deck_show(x)," "
    end
    print " pc_chips [",@pc_chips,"]\n\n"

    @open_deck.deck.each do |x|
      print @open_deck.deck_show(x)," "
    end
    print "pot [",@pot,"]\n\n","my_chips [",@my_chips,"] "

    @my_deck.deck.each do |x|
      print @my_deck.deck_show(x)," "
    end
    print "\n-------------------------------------\n"
    @my_hand = @my_deck.hand(@open_deck.deck)
    @pc_hand = @pc_deck.hand(@open_deck.deck)
  end

  def table_reset
    if @my_hand != 0
      if @my_hand > @pc_hand
        print "my_win ", @my_deck.hand_check(@my_hand), "\n"
        print "pc_lose ", @pc_deck.hand_check(@pc_hand), "\n"
        @my_chips += @pot
      elsif @my_hand == @pc_hand
        if @my_deck.hand_high == @pc_deck.hand_high
          if @my_deck.high_card > @pc_deck.high_card
            print "my_win ", @my_deck.hand_check(@my_hand), "\n"
            print "pc_lose ", @pc_deck.hand_check(@pc_hand), "\n"
            @my_chips += @pot
          else
            print "pc_win ", @pc_deck.hand_check(@pc_hand), "\n"
            print "my_lose ", @my_deck.hand_check(@my_hand), "\n"
            @pc_chips += @pot
          end
        elsif @my_deck.hand_high > @pc_deck.hand_high
          print "my_win ", @my_deck.hand_check(@my_hand), "\n"
          print "pc_lose ", @pc_deck.hand_check(@pc_hand), "\n"
          @my_chips += @pot
        else
          print "pc_win ", @pc_deck.hand_check(@pc_hand), "\n"
          print "my_lose ", @my_deck.hand_check(@my_hand), "\n"
          @pc_chips += @pot
        end
      else
        print "pc_win ", @pc_deck.hand_check(@pc_hand), "\n"
        print "my_lose ", @my_deck.hand_check(@my_hand), "\n"
        @pc_chips += @pot
      end
    end

    @my_hand = 0
    @pc_hand = 0

    @cards = CardDeck.new
    @cards.deck_shuffle
    @my_deck = CardDeck.new
    @pc_deck = CardDeck.new
    @open_deck = CardDeck.new
    if @check == 'f'
      @pc_chips += @pot
    end
  end

  def check_kye
    print "\nb:Bet(50) r:Raise(150) f:Fold\n"
    @check = gets.chomp
    if @my_chips < 50
      @check = 'f'
    end
    while !((@check == 'b') || (@check == 'f') || (@check == 'r'))
      print "\nb:Bet(50) r:Raise(150) f:Fold\n"
      @check = gets.chomp
    end
    if @check == 'b'
      @pot += @bet * 2
      @my_chips -= @bet
      @pc_chips -= @bet
    elsif @check == 'r'
      @pot += @raise * 2
      @my_chips -= @raise
      @pc_chips -= @raise
    end
  end

  def table_show
    @my_deck.deck.each do |x|
      puts @my_deck.deck_show(x)
    end
  end
end