module Expression
  def times(multiplier)
    self.class.new(amount * multiplier, self.currency)
  end

  def +(adder)
    Sum.new(self, adder)
  end

  def equal?(other)
    self.currency == other.currency && amount == other.amount
  end

  def reduce(bank, to_currency)
    rate = bank.rate(currency, to_currency)
    self.class.new(amount / rate, to_currency)
  end
end

class Sum
  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(currency)
    Money.new(@augend.amount + @addend.amount, currency)
  end
end

class Bank
  def initialize
    @rate_table = {}
  end

  def reduce(expr, currency)
    return expr.reduce(currency) unless expr.class == Money

    expr.reduce(self, currency)
  end

  def add_rate(from_currency, to_currency, rate)
    @rate_table[from_currency] = {} unless @rate_table[from_currency]
    @rate_table[to_currency] = {} unless @rate_table[to_currency]
    @rate_table[from_currency][to_currency] = rate
  end

  def rate(from_currency, to_currency)
    return 1 if from_currency == to_currency

    @rate_table[from_currency][to_currency]
  end
end

class Money
  attr_reader :amount, :currency

  include Expression

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def self.dollar(amount)
    new(amount, "USD")
  end

  def self.franc(amount)
    new(amount, "CHF")
  end
end
