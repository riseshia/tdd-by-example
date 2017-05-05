class Dollar
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(number)
    self.class.new(amount * number)
  end
end
