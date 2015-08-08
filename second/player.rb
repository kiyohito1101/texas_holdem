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
  end

end
