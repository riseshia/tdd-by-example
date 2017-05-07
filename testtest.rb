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

class TestTestCase
  attr_reader :summary

  def initialize(name)
    @name = name
    @report = TestTestReport.new
  end

  def run
    setup
    send(@name.to_sym)
  rescue => e
    @report.report(false)
  ensure
    teardown
  end

  def assert(value)
    if value == true
      putc "."
      @report.report(true)
    else
      puts "'#{value}' is refuted."
      @report.report(false)
    end
  end

  def summary
    @report.summary
  end

  # Template Method
  def setup
  end

  def teardown
  end
end
