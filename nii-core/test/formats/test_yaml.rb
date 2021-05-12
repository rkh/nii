require_relative '../setup'

class TestYAML < Minitest::Test
  class TestI18n < TestYAML
    def setup
      super
      @context = @context.with(namespace: 'i18n')
    end

    def test_escaped = assert_equal('1 &gt; 2', @context.render('escaping.escaped'))
    def test_html
      assert_equal('<a>', @context.render('escaping.html'))
      assert_equal('<a>', @context.render('escaping.ends_with_html'))
    end
  end

  class TestR18n < TestYAML
    def setup
      super
      @context = @context.with(namespace: 'r18n')
    end

    def test_escaped = assert_equal('1 &gt; 2', @context.render('escaped'))
    def test_html    = assert_equal('<a>', @context.render('unescaped'))
  end

  def setup
    @context        = Nii::Context.new('en', namespace: 'example')
    @context.lookup = Nii::Lookup.new File.expand_path('yaml', __dir__)
  end

  def test_simple     = assert_equal('value',    @context.render('key'))
  def test_variable   = assert_equal('Hi Sven!', @context.render('interpolated', { name: 'Sven' }))
  def test_positional = assert_equal('example!', @context.render('positional', ['example']))
end
