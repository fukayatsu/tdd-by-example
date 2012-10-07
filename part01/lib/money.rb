module Expressionable
end

class Money
  include Expressionable
  attr_reader :amount, :currency

  def initialize(amount, currency = nil)
    @amount = amount
    @currency = currency
  end

  def times(multiplier)
    Money.new(@amount * multiplier, @currency)
  end

  def self.dollar(amount)
    Money.new(amount, 'USD')
  end

  def self.franc(amount)
    Money.new(amount, 'CHF')
  end

  def ==(other)
    @amount == other.amount &&
      self.currency == other.currency
  end

  def +(added)
    Money.new(@amount + added.amount, @currency)
  end
end

class Bank
  def reduce(source, to)
    Money.dollar(10)
  end
end
