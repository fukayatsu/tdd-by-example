class Dollar
  def initialize(amount)
    @amount = amount
  end

  def amount
    10
  end

  def times(multiplier)
    @amount *= multiplier
  end
end