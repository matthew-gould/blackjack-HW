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
  cards = [:A,2,3,4,5,6,7,8,9,10,:J,:Q,:K]
  suits = [:S,:H,:D,:C]

    suits.each do |x|
      cards.size.each do |y|
        @cards << Card.new(cards[x],y)
      end
    end

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

  def busted?
    if @hand_value > 21
      true
    end
  end

  def blackjack?
    if @hand_value == 21
      true
    end
  end




end