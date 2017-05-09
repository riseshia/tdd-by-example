class TestTestReport
  def initialize
    @total = 0
    @fail = 0
  end

  def report(result)
    @fail += 1 unless result
    @total += 1
  end

  def summary
    "#{@total} run, #{@fail} failed"
  end
end

class TestTest
  def initialize
    @tests = []
  end

  def add(test_case)
    @tests << test_case
  end

  def run(report)
    @tests.each { |test| test.run(report) }
  end
end

class TestTestCase
  attr_reader :summary

  def initialize(name)
    @name = name
  end

  def run(report)
    report = report
    setup
    send(@name.to_sym)
    report.report(true)
  rescue => e
    report.report(false)
  ensure
    teardown
  end

  def assert(value)
    if value == true
      putc "."
    else
      puts "'#{value}' is refuted."
      raise "Assertion Error"
    end
  end

  # Template Method
  def setup
  end

  def teardown
  end
end
