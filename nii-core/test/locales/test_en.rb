require_relative '../setup'

class TestEN < Minitest::Test
  def setup
    @context = Nii::Context.new('en')
  end

  def test_format_number
    assert_equal "1,530.25", @context.format(1530.25)
  end
end
