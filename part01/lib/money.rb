class Money
  class << self
    def dollar(amount)
      Money.new(amount, 'USD')
    end

    def franc(amount)
      Money.new(amount, 'CHF')
    end
  end

  attr_reader :amount, :currency

  def initialize(amount, currency = nil)
    @amount = amount
    @currency = currency
  end

  def reduce(bank, to)
    rate = bank.rate(@currency, to)

    Money.new(amount / rate, to)
  end

  def ==(other)
    @amount == other.amount &&
      self.currency == other.currency
  end

  def *(multiplier)
    Money.new(@amount * multiplier, @currency)
  end

  def +(addend)
    Sum.new(self, addend)
  end
end

class Bank
  attr_reader :rates

  def initialize
    @rates = {}
  end

  def reduce(source, to)
    source.reduce(self, to)
  end

  def add_rate(from, to, rate)
    @rates[[from, to]] = rate
  end

  def rate(from, to)
    return 1 if from == to
    @rates[[from, to]]
  end
end

class Sum
  attr_reader :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(bank, to)
    amount = @augend.reduce(bank, to).amount +
      @addend.reduce(bank, to).amount

    Money.new(amount, to)
  end

  def + (addend)
    Sum.new(self, addend)
  end
end
