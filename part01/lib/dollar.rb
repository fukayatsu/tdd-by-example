class Dollar
  def initialize(amount)
    @amount = amount
  end

  def amount
    @amount
  end

  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end
end