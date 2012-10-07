class Dollar
  def initialize(amount)
    @amount = amount
  end

  attr_reader :amount

  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end

  def ==(other)
    @amount == other.amount
  end
end