require_relative '../setup'
require 'money'

# to avoid warning
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

class TestMoneyFormatter < Minitest::Test
  def setup
    @context = Nii::Context.new :en
  end

  def test_format_money
    assert_equal '$1,200.43', @context.format(Money.usd(1200_43))
    assert_equal '₿100.00', @context.format(Money.from_amount(100, 'BTC'))
  end

  def test_spellout_money
    assert_equal 'one hundred fifty US dollars', @context.spellout(Money.usd(150_00))
  end
end
