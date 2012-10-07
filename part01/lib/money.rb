class Money
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    self.class.new(@amount * multiplier)
  end

  def self.dollar(amount)
    Dollar.new(amount)
  end

  def self.franch(amount)
    Franc.new(amount)
  end

  def ==(other)
    @amount == other.amount &&
      self.class == other.class
  end
end

class Dollar < Money
end

class Franc < Money
end