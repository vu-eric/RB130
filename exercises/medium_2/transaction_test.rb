require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    trans = Transaction.new(70)
    input = StringIO.new("70\n")
    output = StringIO.new

    trans.prompt_for_payment(input: input, output: output)

    assert_equal(70, trans.amount_paid)
  end
end