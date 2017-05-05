class Money
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(number)
    self.class.new(amount * number)
  end

  def equal?(other)
    self.class == other.class && amount == other.amount
  end
end

class Dollar < Money
end

class Franc < Money
end
