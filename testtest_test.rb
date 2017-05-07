#!/usr/bin/env ruby
require_relative "testtest"

class TestTestCaseTest < TestTestCase
  def setup
    @was_setup = true
  end

  def test_running
    test = WasRun.new("test_method")
    puts test.wasRun
    test.run
    puts test.wasRun
  end

  def test_setup
    puts @was_setup
  end
end

TestTestCaseTest.new("test_running").run
TestTestCaseTest.new("test_setup").run
