class CardsDeck
  attr_accessor :cards

  def initialize
    @suit = ["S","H","D","C"]
    @num = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    @cards = Array.new
  end

  #カードを切る
  def deck_shuffle
    card = 52
    new_deck = Array.new(card) {|i| i }
    52.times do |i|
      draw = Random.rand(card - i)
      @cards << new_deck[draw]
      new_deck.delete_at(draw)
    end
  end

  #カードを表示
  def cards_show(card)
    suit = card / 13
    num = card % 13
    @suit[suit] + "-" + @num[num]
  end

  #ポケットハンド判定
  def hand_check
    if (@cards[0] % 13) == (@cards[1] % 13)
      5
    else
      0
    end
  end
end
