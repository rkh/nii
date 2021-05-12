require_relative '../setup'

class TestFluent < Minitest::Test
  def setup
    @context        = Nii::Context.new('en', namespace: 'example')
    @context.lookup = Nii::Lookup.new File.expand_path('fluent', __dir__)
  end

  def test_simple()    = assert_equal('value',       @context.render('key'))
  def test_variable()  = assert_equal('Hi Sven.',    @context.render('with-variable', { name: 'Sven' }))
  def test_term()      = assert_equal('term-value!', @context.render('with-term'))
  def test_message()   = assert_equal('value!',      @context.render('with-message'))
  def test_attribute() = assert_equal('42',          @context.render('with-attribute'))
  def test_shared()    = assert_equal('correct',     @context.render('with-shared'))
  def test_number_function() = assert_equal('V', @context.render('number', { value: 5 }))
end
