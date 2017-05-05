#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'money'

class MoneyTest < Minitest::Test
  def test_muliplication
    five = Dollar.new(5)
    assert_same Dollar.new(10), five.times(2)
    assert_same Dollar.new(15), five.times(3)
  end

  def test_equality
    assert_same Dollar.new(5), Dollar.new(5)
    refute_same Dollar.new(5), Dollar.new(6)
  end
end
