#!/usr/bin/env ruby
require_relative "testtest"

class WasRun < TestTestCase
  attr_accessor :was_run

  def setup
    @was_setup = true
  end

  def initialize(name)
    @was_run = nil
    super
  end

  def test_method
    @was_run = true
  end
end

class TestTestCaseTest < TestTestCase
  def setup
    @was_setup = true
  end

  def test_running
    test = WasRun.new("test_method")
    refute test.was_run
    test.run
    assert test.was_run
  end

  def test_setup
    assert @was_setup
  end
end

TestTestCaseTest.new("test_running").run
TestTestCaseTest.new("test_setup").run
