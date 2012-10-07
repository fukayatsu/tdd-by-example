class Money
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Money.new(@amount * multiplier)
  end

  def ==(other)
    @amount == other.amount
  end
end

class Dollar < Money
end

class Franc < Money
end