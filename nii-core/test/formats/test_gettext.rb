require_relative '../setup'

class TestGettext < Minitest::Test
  def setup
    @context        = Nii::Context.new('en', namespace: 'example')
    @context.lookup = Nii::Lookup.new File.expand_path('gettext', __dir__)
  end

  def test_simple()     = assert_equal('value',      @context.render('key'))
  def test_variable()   = assert_equal('Hi Masaos!', @context.render('interpolated', { name: 'Masao' }))
  def test_positional() = assert_equal('example!',   @context.render('positional', ['example']))
end
