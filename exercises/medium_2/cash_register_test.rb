require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def test_accept_money 
    trans = Transaction.new(20)
    trans.amount_paid = 20
    register = CashRegister.new(10)

    previous_amount = register.total_money 
    register.accept_money(trans)
    current_amount = register.total_money 

    assert_equal(previous_amount + 20, current_amount)
  end

  def test_change
    register = CashRegister.new(10)
    trans = Transaction.new(20)
    trans.amount_paid = 30

    assert_equal(10, register.change(trans)) 
  end

  def test_give_receipt 
    register = CashRegister.new(10)
    trans = Transaction.new(20)
    assert_output("You've paid $20.\n"){register.give_receipt(trans)}
  end
end