class TestTestCase
  def initialize(name)
    @name = name
  end

  def run
    setup
    send(@name.to_sym)
  end

  # Template Method
  def setup
  end
end

class WasRun < TestTestCase
  attr_reader :wasRun

  def initialize(name)
    @wasRun = nil
    super
  end

  def test_method
    @wasRun = true
  end
end
