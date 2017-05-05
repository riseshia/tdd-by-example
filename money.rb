class Money
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    self.class.new(amount * multiplier)
  end

  def equal?(other)
    self.class == other.class && amount == other.amount
  end

  def self.dollar(amount)
    Dollar.new(amount)
  end

  def self.franc(amount)
    Franc.new(amount)
  end
end

class Dollar < Money
end

class Franc < Money
end
