class Player
  attr_accessor :chip, :play_deck, :offensive, :action_check

  def initialize
    @chip = 2000
    @play_deck = CardsDeck.new
    @action_check = String.new
    @offensive = 0
    @hand = 0
  end

  def input_key(min_chip)
    self.action_check = gets.chomp
    if self.chip < min_chip
      self.action_check = 'f'
    end
    while !((self.action_check == 'b') || (self.action_check == 'f') || (self.action_check == 'r') || (self.action_check == 'c'))
      print "\nc:Check b:Bet(50) r:Raise(150) f:Fold\n"
      self.action_check = gets.chomp
    end
  end

  def pc_input_key(min_chip)
    if ((self.offensive + 2) > (Random.rand(10)))
      if self.chip > (min_chip * 5)
        self.action_check = 'r'
      elsif self.chip >= (min_chip)
        self.action_check = 'c'
      end
        self.action_check = 'f'
      end
    else
      if self.chip < min_chip
        self.action_check = 'f'
      else
        self.action_check = 'c'
      end
    end
  end

  def pot_in(my_pot,pc_pot)
    case self.action_check
    when 'c'
    when 'r'
      raise
    else

    end
  end

end
