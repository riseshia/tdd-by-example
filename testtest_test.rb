#!/usr/bin/env ruby
require_relative "testtest"

class WasRun < TestTestCase
  attr_accessor :log

  def initialize(name)
    @log = ""
    super
  end

  def test_method
    assert true
    @log += " test_method"
  end
end

class WasBroken < TestTestCase
  attr_accessor :log

  def initialize(name)
    super
  end

  def test_method
    raise "Fail!!!!"
  end
end

class WasSetup < TestTestCase
  attr_accessor :log

  def setup
    @log += "setup"
  end

  def initialize(name)
    @log = ""
    super
  end

  def test_method
  end
end

class WasTeardown < TestTestCase
  attr_accessor :log

  def teardown
    @log += " teardown"
  end

  def initialize(name)
    @log = ""
    super
  end

  def test_method
  end
end

class TestTestCaseTest < TestTestCase
  def setup
    @result = TestTestReport.new
  end

  def test_running
    test = WasRun.new("test_method")
    assert test.log == ""
    test.run(@result)
    assert test.log == " test_method"
  end

  def test_setup
    test = WasSetup.new("test_method")
    assert test.log == ""
    test.run(@result)
    assert test.log == "setup"
  end

  def test_teardown
    test = WasTeardown.new("test_method")
    assert test.log == ""
    test.run(@result)
    assert test.log == " teardown"
  end

  def test_result
    test = WasRun.new("test_method")
    test.run(@result)
    assert @result.summary == "1 run, 0 failed"
  end

  def test_broken_test
    test = WasBroken.new("test_method")
    test.run(@result)
    assert @result.summary == "1 run, 1 failed"
  end

  def test_test_suite
    suite = TestTest.new
    suite.add(WasRun.new("test_method"))
    suite.add(WasBroken.new("test_method"))
    suite.run(@result)
    assert @result.summary == "2 run, 1 failed"
  end
end

suite = TestTest.new
suite.add(TestTestCaseTest.new("test_running"))
suite.add(TestTestCaseTest.new("test_setup"))
suite.add(TestTestCaseTest.new("test_teardown"))
suite.add(TestTestCaseTest.new("test_result"))
suite.add(TestTestCaseTest.new("test_broken_test"))
suite.add(TestTestCaseTest.new("test_test_suite"))
result = TestTestReport.new
suite.run(result)
puts result.summary
