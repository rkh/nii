require_relative 'setup'

class TestPlurals < Minitest::Test
  def setup   = @locale ||= :en
  def plurals = Nii::Context.new(@locale).grammar.plurals
  
  def test_en_cardinal
    assert_equal :one,   plurals.classify(1)
    assert_equal :one,   plurals.classify(-1)
    assert_equal :other, plurals.classify(1.0)
    assert_equal :other, plurals.classify(2)
    assert_equal :one,   plurals.classify(:one)
    assert_equal :other, plurals.classify(:few)
    assert_equal [:one, :other], plurals.categories.sort
  end

  def test_en_ordinal
    assert_equal :one,   plurals.classify(:ordinal, 1)
    assert_equal :two,   plurals.classify(:ordinal, 2)
    assert_equal :few,   plurals.classify(:ordinal, 3)
    assert_equal :other, plurals.classify(:ordinal, 4)
    assert_equal :other, plurals.classify(:ordinal, 13)
    assert_equal :few,   plurals.classify(:ordinal, 23)
    assert_equal :other, plurals.classify(:ordinal, 113)
    assert_equal :few,   plurals.classify(:ordinal, 123)
    assert_equal [:few, :one, :other, :two], plurals.categories(:ordinal).sort
  end

  def test_en_ranges
    assert_equal :other, plurals.classify(1..3)
  end

  unless ENV['FAST_TEST']
    Nii::DATA.known_locales(false).each do |locale|
      define_method("test_#{locale}") do
        @locale    = locale
        categories = plurals.categories
        assert categories.include?(plurals.classify(1))
        assert categories.include?(plurals.classify(1.0))
        assert categories.include?(plurals.classify(-500))
        assert categories.include?(plurals.classify(0..1))
      end
    end
  end
end
