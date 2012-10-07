class Money
  attr_reader :amount, :currency

  def initialize(amount, currency = nil)
    @amount = amount
    @currency = currency
  end

  def times(multiplier)
    Money.new(@amount * multiplier, @currency)
  end

  def reduce(to)
    if @currency == 'CHF'
      rate = 2
    else
      rate = 1
    end

    Money.new(amount / rate, to)
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

  def +(addend)
    Sum.new(self, addend)
  end
end

class Bank
  def reduce(source, to)
    source.reduce(to)
  end

  def add_rate(foo, bar, baz)
  end
end

class Sum
  attr_reader :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(to)
    amount = @augend.amount +
      @addend.amount

    Money.new(amount, to)
  end
end
