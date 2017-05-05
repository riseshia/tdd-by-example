class Money
  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def times(multiplier)
    self.class.new(amount * multiplier, self.currency)
  end

  def equal?(other)
    self.currency == other.currency && amount == other.amount
  end

  def self.dollar(amount)
    new(amount, "USD")
  end

  def self.franc(amount)
    new(amount, "CHF")
  end
end
