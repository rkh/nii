require_relative '../setup'

class TestArrayFormatter < Minitest::Test
  def setup
    @context = Nii::Context.new
  end

  def test_root
    assert_equal '1, 2, 3', @context.format([1, 2, 3])
  end

  def test_en
    @context.locale = :en
    assert_equal '',            @context.format([])
    assert_equal '1',           @context.format([1])
    assert_equal '1 and 2',     @context.format([1, 2])
    assert_equal '1, 2, and 3', @context.format([1, 2, 3])
    assert_equal '1 or 2',      @context.format([1, 2], list_style: :or)
    assert_equal '1, 2',        @context.format([1, 2], list_style: :unit)
  end

  def test_de
    @context.locale = :de
    assert_equal '',            @context.format([])
    assert_equal '1',           @context.format([1])
    assert_equal '1 und 2',     @context.format([1, 2])
    assert_equal '1, 2 und 3',  @context.format([1, 2, 3])
    assert_equal '1 oder 2',    @context.format([1, 2], list_style: :or)
    assert_equal '1, 2',        @context.format([1, 2], list_style: :unit)
  end

  def test_es
    @context.locale = :es
    assert_equal 'agua y hielo', @context.format(['agua', 'hielo'])
    assert_equal 'tos e hipo',   @context.format(['tos', 'hipo'])
    assert_equal 'tos o hipo',   @context.format(['tos', 'hipo'], list_style: :or)
  end

  def test_he
    @context.locale = :he
    # if this is displayed in a strange order your editor is just having issues with mixing ltr and rtl
    assert_equal '1 -ו2', @context.format([1, 2])
    assert_equal 'אדום וירוק', @context.format(['אדום', 'ירוק'])
  end

  def test_element_formatting
    assert_equal 'I, II', @context.format([1, 2], numbers: :roman)
    assert_equal '2, 3', @context.format([1, 2]) { |e| e + 1 }
  end
end
