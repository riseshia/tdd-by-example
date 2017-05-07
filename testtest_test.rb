#!/usr/bin/env ruby
require_relative "testtest"

class WasRun < TestTestCase
  attr_accessor :log

  def setup
    @log += "setup"
  end

  def initialize(name)
    @log = ""
    super
  end

  def test_method
    @log += " test_method"
  end
end

class TestTestCaseTest < TestTestCase
  def test_running
    test = WasRun.new("test_method")
    assert test.log == ""
    test.run
    assert test.log == "setup test_method"
  end
end

TestTestCaseTest.new("test_running").run
TestTestCaseTest.new("test_setup").run
