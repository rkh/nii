require_relative 'setup'

class TestRBNF < Minitest::Test
  SOURCE = <<-RBNF
    -x: MINUS →→;
    x.x: ←← POINT →→;
    0.x: OH POINT →→;
    x.0: ←← POINT OH;
    Inf: INFINITY;
    NaN: NOT A NUMBER;
    0:   ZERO;
    1:   ONE OR TWO;
    3:   THREE;
    4:   MORE THAN THREE;

    %public-rule:
    -x: -→→;
    0: =%%private-rule=;

    %%private-rule:
    -x: -→→;
    0: =#,##0.0=;
  RBNF

  def setup
    @rbnf = Nii::RBNF.load(SOURCE)
  end

  def test_direct
    assert_equal 'ZERO', @rbnf.format(0)
  end

  def test_between
    assert_equal 'ONE OR TWO', @rbnf.format(1)
    assert_equal 'ONE OR TWO', @rbnf.format(2)
    assert_equal 'THREE',      @rbnf.format(3)
  end

  def test_end
    assert_equal 'MORE THAN THREE', @rbnf.format(4)
    assert_equal 'MORE THAN THREE', @rbnf.format(500000)
  end

  def test_minus
    assert_equal 'MINUS ONE OR TWO', @rbnf.format(-1)
    assert_equal 'MINUS MORE THAN THREE', @rbnf.format(-10)
  end

  def test_floats
    assert_equal 'ONE OR TWO POINT OH', @rbnf.format(1.0)
    assert_equal 'OH POINT MORE THAN THREE', @rbnf.format(0.5)
    assert_equal 'THREE POINT THREE', @rbnf.format(3.3)
  end

  def test_inf
    assert_equal 'INFINITY', @rbnf.format(Float::INFINITY)
    assert_equal 'MINUS INFINITY', @rbnf.format(-Float::INFINITY)
  end

  def test_nan
    assert_equal 'NOT A NUMBER', @rbnf.format(Float::NAN)
    assert_equal 'NOT A NUMBER', @rbnf.format(-Float::NAN)
  end

  def test_public
    assert_equal '1,000.0', @rbnf.format(1000, 'public-rule')
  end

  def test_private
    assert_raises { @rbnf.format(1000, 'private-rule') }
  end
end
