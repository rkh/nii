require_relative 'setup'

class TestDecimalFormat < Minitest::Test
  def test_simple_integers
    assert_equal '10',    Nii::DecimalFormat['0'].format(10)
    assert_equal '10',    Nii::DecimalFormat['00'].format(10)
    assert_equal '10',    Nii::DecimalFormat['#00'].format(10)
    assert_equal '010',   Nii::DecimalFormat['000'].format(10)
    assert_equal '010',   Nii::DecimalFormat['#000'].format(10)
    assert_equal '100',   Nii::DecimalFormat['#000'].format(100)
    assert_equal '1000',  Nii::DecimalFormat['#000'].format(1000)
    assert_equal '10000', Nii::DecimalFormat['#000'].format(10000)
  end

  def test_negative_integers
    assert_equal '-1',      Nii::DecimalFormat['0'].format(-1)
    assert_equal '(1)',     Nii::DecimalFormat['0;(0)'].format(-1)
    assert_equal '(1,000)', Nii::DecimalFormat['#,##0;(#)'].format(-1000)
  end

  def test_min_integers_option
    assert_equal '10',     Nii::DecimalFormat['0'].format(10,    min_integers: 1)
    assert_equal '01',     Nii::DecimalFormat['0'].format(1,     min_integers: 2)
    assert_equal '1',      Nii::DecimalFormat['00'].format(1,    min_integers: 1)
    assert_equal '0001',   Nii::DecimalFormat['00'].format(1,    min_integers: 4)
    assert_equal '0,001',  Nii::DecimalFormat['#,##0'].format(1, min_integers: 4)
  end

  def test_grouping
    assert_equal '10',           Nii::DecimalFormat['#,##0'].format(10)
    assert_equal '1,000',        Nii::DecimalFormat['#,##0'].format(1000)
    assert_equal '10,000',       Nii::DecimalFormat['#,##0'].format(10000)
    assert_equal '100,000',      Nii::DecimalFormat['#,##0'].format(100000)
    assert_equal '1,000,000',    Nii::DecimalFormat['#,##0'].format(1000000)
    assert_equal '10,00,000',    Nii::DecimalFormat['#,##,##0'].format(1000000)
    assert_equal '10,00,00,000', Nii::DecimalFormat['#,##,##0'].format(100000000)
  end

  def test_fraction
    assert_equal '1',    Nii::DecimalFormat['#,##0'].format(1.4)
    assert_equal '1.4',  Nii::DecimalFormat['#,##0.0'].format(1.4)
    assert_equal '1.0',  Nii::DecimalFormat['#,##0.0'].format(1)
    assert_equal '1.4',  Nii::DecimalFormat['#,##0.0'].format(1.43)
    assert_equal '1.43', Nii::DecimalFormat['#,##0.0#'].format(1.43)
    assert_equal '1.4',  Nii::DecimalFormat['#,##0.0#'].format(1.4)
    assert_equal '1.40', Nii::DecimalFormat['#,##0.00'].format(1.4)
    assert_equal '1.4',  Nii::DecimalFormat['@#'].format(1.4)
    assert_equal '1.43', Nii::DecimalFormat['@#'].format(1.43)
    assert_equal '1.43', Nii::DecimalFormat['@#'].format(1.432)
  end

  def test_percent
    assert_equal '150.0%',   Nii::DecimalFormat['#,##0.0%'].format(1.5)
    assert_equal '1,500.0%', Nii::DecimalFormat['#,##0.0%'].format(15)
  end

  def test_percentile
    assert_equal '150.0‰',   Nii::DecimalFormat['#,##0.0‰'].format(0.15)
    assert_equal '1,500.0‰', Nii::DecimalFormat['#,##0.0‰'].format(1.5)
  end

  def test_sign
    assert_equal '-1', Nii::DecimalFormat['0'].format(-1)
    assert_equal '0',  Nii::DecimalFormat['0'].format(0)
    assert_equal '1',  Nii::DecimalFormat['0'].format(1)

    assert_equal '-1', Nii::DecimalFormat['0'].format(-1, display_sign: 'auto')
    assert_equal '0',  Nii::DecimalFormat['0'].format(0,  display_sign: 'auto')
    assert_equal '1',  Nii::DecimalFormat['0'].format(1,  display_sign: 'auto')

    assert_equal '-1', Nii::DecimalFormat['0'].format(-1, display_sign: :auto)
    assert_equal '0',  Nii::DecimalFormat['0'].format(0,  display_sign: :auto)
    assert_equal '1',  Nii::DecimalFormat['0'].format(1,  display_sign: :auto)

    assert_equal '1',  Nii::DecimalFormat['0'].format(-1, display_sign: 'never')
    assert_equal '0',  Nii::DecimalFormat['0'].format(0,  display_sign: 'never')
    assert_equal '1',  Nii::DecimalFormat['0'].format(1,  display_sign: 'never')

    assert_equal '1',  Nii::DecimalFormat['0'].format(-1, display_sign: :never)
    assert_equal '0',  Nii::DecimalFormat['0'].format(0,  display_sign: :never)
    assert_equal '1',  Nii::DecimalFormat['0'].format(1,  display_sign: :never)

    assert_equal '-1', Nii::DecimalFormat['0'].format(-1, display_sign: 'always')
    assert_equal '+0', Nii::DecimalFormat['0'].format(0,  display_sign: 'always')
    assert_equal '+1', Nii::DecimalFormat['0'].format(1,  display_sign: 'always')

    assert_equal '-1', Nii::DecimalFormat['0'].format(-1, display_sign: :always)
    assert_equal '+0', Nii::DecimalFormat['0'].format(0,  display_sign: :always)
    assert_equal '+1', Nii::DecimalFormat['0'].format(1,  display_sign: :always)

    assert_equal '-1', Nii::DecimalFormat['0'].format(-1, display_sign: 'except_zero')
    assert_equal '0',  Nii::DecimalFormat['0'].format(0,  display_sign: 'except_zero')
    assert_equal '+1', Nii::DecimalFormat['0'].format(1,  display_sign: 'except_zero')

    assert_equal '-1', Nii::DecimalFormat['0'].format(-1, display_sign: :except_zero)
    assert_equal '0',  Nii::DecimalFormat['0'].format(0,  display_sign: :except_zero)
    assert_equal '+1', Nii::DecimalFormat['0'].format(1,  display_sign: :except_zero)
  end
end
