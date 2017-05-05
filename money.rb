class Dollar
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(number)
    @amount *= number
  end
end
