require_relative '../setup'

class TestFluent < Minitest::Test
  def setup
    @context        = Nii::Context.new('en', namespace: 'example')
    @context.lookup = Nii::Lookup.new File.expand_path('fluent', __dir__)
  end

  def test_simple          = assert_equal('value',               @context.render('key'))
  def test_variable        = assert_equal('Hi Sven.',            @context.render('with-variable', { name: 'Sven' }))
  def test_term            = assert_equal('term-value!',         @context.render('with-term'))
  def test_message         = assert_equal('value!',              @context.render('with-message'))
  def test_attribute       = assert_equal('42',                  @context.render('with-attribute'))
  def test_shared          = assert_equal('correct',             @context.render('with-shared'))
  def test_number_function = assert_equal('V',                   @context.render('number', { value: 5 }))
  def test_string          = assert_equal('&quot;hi&quot; B 👋', @context.render('string'))

  def test_plural_select
    assert_equal 'result: none',     @context.render('with-plurals', { count: 0 })
    assert_equal 'result: just one', @context.render('with-plurals', { count: 1 })
    assert_equal 'result: many',     @context.render('with-plurals', { count: 2 })
  end

  def test_plural_formatted
    assert_equal 'You scored zero points. What happened?', @context.render('your-score', { score: 0 })
    assert_equal 'You scored 1.0 points.', @context.render('your-score', { score: 1 })
  end

  def test_ordinal_plural
    assert_equal 'You finished first!', @context.render('your-rank', { pos: 1 })
    assert_equal 'You finished 2nd',    @context.render('your-rank', { pos: 2 })
    assert_equal 'You finished 3rd',    @context.render('your-rank', { pos: 3 })
    assert_equal 'You finished 4th',    @context.render('your-rank', { pos: 4 })
    assert_equal 'You finished 13th',   @context.render('your-rank', { pos: 13 })
    assert_equal 'You finished 23rd',   @context.render('your-rank', { pos: 23 })
    assert_equal 'You finished 101st',  @context.render('your-rank', { pos: 101 })
  end
end
