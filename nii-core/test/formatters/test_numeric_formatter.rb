require_relative '../setup'

class TestNumericFormatter < Minitest::Test
  def format(locale, ...) = Nii::Context.new(locale).format(...)

  def test_no_options
    assert_equal '1',       format(:root,   1)
    assert_equal '1,530.5', format(:root,   1530.5)
    assert_equal '1,530.5', format(:en,     1530.5)
    assert_equal '1.530,5', format(:de,     1530.5)
    assert_equal '1’530.5', format('de-CH', 1530.5)
    assert_equal '١٬٥٣٠٫٥', format(:ar,     1530.5)
  end

  def test_numbering_system
    assert_equal '1,530',      format(:en, 1530, numbers: :traditional)
    assert_equal '一千五百三十', format(:zh, 1530, numbers: :traditional)
    assert_equal '一千五百三十', format(:en, 1530, numbers: :hant)
    assert_equal 'MDXXX',      format(:en, 1530, numbers: :roman)
    assert_equal 'MDXXX',      format('en-u-nu-roman', 1530)
  end

  def test_precision
    assert_equal '1.00', format(:en, 1,     precision: 2)
    assert_equal '1.00', format(:en, 1.0,   precision: 2)
    assert_equal '1.55', format(:en, 1.553, precision: 2)
    assert_equal '1.5',  format(:en, 1.5,   min_precision: 1, max_precision: 2)
    assert_equal '1.55', format(:en, 1.553, min_precision: 1, max_precision: 2)
  end

  def test_round
    assert_equal '1',  format(:en, 1.4,  precision: 0)
    assert_equal '2',  format(:en, 1.5,  precision: 0)
    assert_equal '2',  format(:en, 1.6,  precision: 0)
    assert_equal '-2', format(:en, -1.5, precision: 0)
    assert_equal '1',  format(:en, 1.4,  precision: 0, round: :halfeven)
    assert_equal '2',  format(:en, 1.5,  precision: 0, round: :halfeven)
    assert_equal '2',  format(:en, 1.6,  precision: 0, round: :halfeven)
    assert_equal '-2', format(:en, -1.5, precision: 0, round: :halfeven)
    assert_equal '1',  format(:en, 1.4,  precision: 0, round: :halfodd)
    assert_equal '1',  format(:en, 1.5,  precision: 0, round: :halfodd)
    assert_equal '2',  format(:en, 1.6,  precision: 0, round: :halfodd)
    assert_equal '-1', format(:en, -1.5, precision: 0, round: :halfodd)
    assert_equal '1',  format(:en, 1.4,  precision: 0, round: :halfdown)
    assert_equal '1',  format(:en, 1.5,  precision: 0, round: :halfdown)
    assert_equal '2',  format(:en, 1.6,  precision: 0, round: :halfdown)
    assert_equal '-1', format(:en, -1.5, precision: 0, round: :halfdown)
    assert_equal '1',  format(:en, 1.4,  precision: 0, round: :halfup)
    assert_equal '2',  format(:en, 1.5,  precision: 0, round: :halfup)
    assert_equal '2',  format(:en, 1.6,  precision: 0, round: :halfup)
    assert_equal '-2', format(:en, -1.5, precision: 0, round: :halfup)
    assert_equal '1',  format(:en, 1.4,  precision: 0, round: :down)
    assert_equal '1',  format(:en, 1.5,  precision: 0, round: :down)
    assert_equal '1',  format(:en, 1.6,  precision: 0, round: :down)
    assert_equal '-1', format(:en, -1.5, precision: 0, round: :down)
    assert_equal '2',  format(:en, 1.4,  precision: 0, round: :up)
    assert_equal '2',  format(:en, 1.5,  precision: 0, round: :up)
    assert_equal '2',  format(:en, 1.6,  precision: 0, round: :up)
    assert_equal '-2', format(:en, -1.5, precision: 0, round: :up)
    assert_equal '1',  format(:en, 1.4,  precision: 0, round: :halfceiling)
    assert_equal '2',  format(:en, 1.5,  precision: 0, round: :halfceiling)
    assert_equal '2',  format(:en, 1.6,  precision: 0, round: :halfceiling)
    assert_equal '-1', format(:en, -1.5, precision: 0, round: :halfceiling)
    assert_equal '1',  format(:en, 1.4,  precision: 0, round: :halffloor)
    assert_equal '1',  format(:en, 1.5,  precision: 0, round: :halffloor)
    assert_equal '2',  format(:en, 1.6,  precision: 0, round: :halffloor)
    assert_equal '-2', format(:en, -1.5, precision: 0, round: :halffloor)
    assert_equal '2',  format(:en, 1.4,  precision: 0, round: :ceiling)
    assert_equal '2',  format(:en, 1.5,  precision: 0, round: :ceiling)
    assert_equal '2',  format(:en, 1.6,  precision: 0, round: :ceiling)
    assert_equal '-1', format(:en, -1.5, precision: 0, round: :ceiling)
    assert_equal '1',  format(:en, 1.4,  precision: 0, round: :floor)
    assert_equal '1',  format(:en, 1.5,  precision: 0, round: :floor)
    assert_equal '1',  format(:en, 1.6,  precision: 0, round: :floor)
    assert_equal '-2', format(:en, -1.5, precision: 0, round: :floor)

    assert '1', format(:en, 1.0, precision: 0, round: :unnecessary)
    assert_raises { format(:en, 1.5, precision: 0, round: :unnecessary) }
    assert_raises { format(:en, 1.5, precision: 0, round: :unknown) }
  end
end
