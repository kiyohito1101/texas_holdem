class CardDeck
  attr_accessor :deck, :high_card, :hand_high

  def initialize
    @suit = ["S","H","D","C"]
    @num = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    @deck = Array.new
    @check_suit = Array.new
    @check_num = Array.new
    @high_card = 0
    @hand_high = 0
  end

  def deck_shuffle
    card = 52
    @new_deck = Array.new(card) {|i| i }
    52.times do |i|
      draw = Random.rand(card - i)
      @deck << @new_deck[draw]
      @new_deck.delete_at(draw)
    end
  end

  def deck_show(card)
    suit = card / 13
    num = card % 13
    @suit[suit] + "-" + @num[num]
  end

  def check_high_card(cards)
    card1 = cards[0] % 13
    card2 = cards[1] % 13
    if card1 == 0
      card1 = 13
    end
    if card2 == 0
      card2 = 13
    end
    card1 > card2 ? @high_card = card1 : @high_card = card2
  end

  def hand(open_deck)
    work_num = Array.new(14, 0)
    work_suit = Array.new(4, 0)
    hand = 1
    @deck += open_deck
    @deck.each do |card|
      @check_suit << card / 13
      @check_num << card % 13
    end

    @check_num.each do |i|
      if i == 0
        work_num[0] = work_num[0] + 1
        work_num[13] = work_num[13] + 1
      else
        work_num[i] = work_num[i] + 1
      end
    end

    @check_suit.each do |i|
      work_suit[i] = work_suit[i] + 1
    end
    
    x = 0
    work_num.each do |i|
      if i > 0
        x += 1
      elsif i == 0
        x = 0
      end
      if (x >= 5)
        hand = 5
      end
    end

    work_suit.each do |i|
      if (i == 5) && (hand == 5)
        hand = 9
      elsif (i == 5)
        hand 6
      end
    end

    work_num.delete_at(13)
    x = 0
    work_num.each do |i|
      if (i == 4)
        hand = 8
        @hand_high = x
      elsif ((i == 3) && (hand == 2)) || ((i == 2) && (hand == 4)) || ((i == 3) && (hand == 4))
        hand = 7
        @hand_high = x
      elsif (i == 3) && (hand < 4)
        hand = 4
        @hand_high = x
      elsif (i == 2) && (hand == 2)
        hand = 3
        @hand_high = x
      elsif (i == 2) && (hand < 2)
        hand = 2
        @hand_high = x
      end
      x += 1
    end

    #if @hand_high == 


    p @check_num
    p work_num
#    p @check_suit
#    p work_suit

    if @deck.include?([0,9,10,11,12]) || @deck.include?([13,22,23,24,25]) || @deck.include?([26,35,36,37,38]) || @deck.include?([39,48,49,50,51])
      hand = 10
    end

    if hand == 5
      x = 0
      y = 0
      work_num.each do |i|
        y += 1
        if i > 0
          x += 1
        elsif i == 0
          x = 0
        end
        if (x >= 5)
          @deck.each do |i|
            if i == work_num[y]
              @hand_high = work_num[y]
            end
          end
        end
      end
    end

    return hand
  end

  def hand_check(hand)
    if hand == 10
      hand = "Royal Straight Flush"
    elsif hand == 9
      hand = "Straight Flush"
    elsif hand == 8
      hand = "Four of a Kind"
    elsif hand == 7
      hand = "Full House"
    elsif hand == 6
      hand = "Flush"
    elsif hand == 5
      hand = "Straight"
    elsif hand == 4
      hand = "Three of a Kind"
    elsif hand == 3
      hand = "Two Pair"
    elsif hand == 2
      hand = "One Pair"
    elsif hand == 1
      hand = "High Cards"
    end

    return hand
  end

end