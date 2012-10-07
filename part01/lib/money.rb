class Money
  attr_reader :amount, :currency

  def initialize(amount, currency = nil)
    @amount = amount
    @currency = currency
  end

  def times(multiplier)
    Money.new(@amount * multiplier, @currency)
  end

  def self.dollar(amount)
    Dollar.new(amount, 'USD')
  end

  def self.franc(amount)
    Franc.new(amount, 'CHF')
  end

  def ==(other)
    @amount == other.amount &&
      self.currency == other.currency
  end

  class Dollar < Money
  end

  class Franc < Money
  end
end

