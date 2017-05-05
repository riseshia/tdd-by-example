class Dollar
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(number)
    self.class.new(amount * number)
  end

  def equal?(other)
    amount == other.amount
  end
end
