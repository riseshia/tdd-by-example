class TestTestCase
  def initialize(name)
    @name = name
  end

  def run
    send(@name.to_sym)
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
