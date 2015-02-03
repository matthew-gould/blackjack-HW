require "pry"

class Card

  def initialize(value, suit)
    @value = value
    @suit = suit
    @rank = value
  end

attr_reader :rank

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
  @cards = []
  cards = [:A,2,3,4,5,6,7,8,9,10,:J,:Q,:K]
  suits = [:S,:H,:D,:C]
     suits.each do |x|
      cards.size.times do |y|
        @cards << Card.new(cards[y],x)
      end
    end
  @drawn = []

  end

  def cards
    @cards
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
    @hand = []
    @hand_suit = []
  end

  def value
    @hand_value
  end

  def add(*cards)
    cards.each do |card|
      @hand_suit << "#{card.rank}"+"#{card.suit}"
      @hand_value += card.value
      @hand << card.value
    end
    if @hand_value > 21 && @hand.include?(11)
      @hand_value = @hand_value -= 10
      @hand.delete(11)
      @hand << 1
      return @hand_value
    end
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

  def to_s
    @hand_suit = "#{@hand_suit.join(", ")}"
    return @hand_suit
  end
end


