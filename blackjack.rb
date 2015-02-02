class Card

  def initialize(value, suit)
    @value = value
    @suit = suit
    
  end

  def value
    if [:K, :Q, :J].include?(@value)
      return 10
    elsif [:A].include?(@value)
      return 11
    else
      return @value
    end
  end

  def suit
    return @suit
  end
end

class Deck

  def initialize
    @cards = (1..52).to_a
    @drawn = []
  end

  def cards
    return @cards
  end

  def drawn
    return @drawn
  end

  def draw
    x = @cards.pop
    @drawn.push x
    return x
  end
end

class Hand

  def initialize
    @hand_value = 0
  end

  def add(*cards)
    cards.each do |card|
      @hand_value += card.value
    end
    return @hand_value
  end

  def value
    @hand_value
  end



















end