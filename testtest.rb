def assert(value)
  if value
    putc "."
  else
    "'#{value}' is refuted."
  end
end

def refute(value)
  assert not(value)
end

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
