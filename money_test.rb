#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'money'

class MoneyTest < Minitest::Test
  def test_muliplication
    five = Money.dollar(5)
    assert_same Money.dollar(10), five.times(2)
    assert_same Money.dollar(15), five.times(3)
  end

  def test_addition
    sum = Money.dollar(5) + Money.dollar(5)
    bank = Bank.new
    reduced = bank.reduce(sum, "USD")
    assert_same Money.dollar(10), reduced
  end

  def test_reduce_different_currency
    bank = Bank.new
    bank.add_rate("CHF", "USD", 2)
    result = bank.reduce(Money.franc(2), "USD")
    assert_same Money.dollar(1), result
  end

  def test_rate_with_same_currency
    bank = Bank.new
    assert_equal 1,  bank.rate("USD", "USD")
  end

  def test_equality
    assert_same Money.dollar(5), Money.dollar(5)
    refute_same Money.dollar(5), Money.dollar(6)

    refute_same Money.franc(5), Money.dollar(5)
  end

  def test_currency
    assert_equal "USD", Money.dollar(1).currency
    assert_equal "CHF", Money.franc(1).currency
  end
end
