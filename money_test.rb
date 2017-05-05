#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'money'

class MoneyTest < Minitest::Test
  def test_muliplication
    five = Dollar.new(5)
    five.times(2)
    assert_equal 10, five.amount
  end
end
