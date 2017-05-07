#!/usr/bin/env ruby
require_relative "testtest"

class TestTestCaseTest < TestTestCase
  def test_running
    test = WasRun.new("testMethod")
    puts test.wasRun
    test.run
    puts test.wasRun
  end
end

TestTestCaseTest.new("test_running").run
