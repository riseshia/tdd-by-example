def assert(value)
  if value == true
    putc "."
  else
    puts "'#{value}' is refuted."
  end
end

class TestTestCase
  def initialize(name)
    @name = name
  end

  def run
    setup
    send(@name.to_sym)
    teardown
  end

  # Template Method
  def setup
  end

  def teardown
  end
end
