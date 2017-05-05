#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'money'

class MoneyTest < Minitest::Test
  def test_muliplication
    five = Money.dollar(5)
    assert_same Money.dollar(10), five.times(2)
    assert_same Money.dollar(15), five.times(3)

    five = Money.franc(5)
    assert_same Money.franc(10), five.times(2)
    assert_same Money.franc(15), five.times(3)
  end

  def test_equality
    assert_same Money.dollar(5), Money.dollar(5)
    refute_same Money.dollar(5), Money.dollar(6)
    assert_same Money.franc(5), Money.franc(5)
    refute_same Money.franc(5), Money.franc(6)

    refute_same Money.franc(5), Money.dollar(5)
  end
end
