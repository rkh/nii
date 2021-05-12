require_relative 'setup'

class TestHelpers < Minitest::Test
  def test_no_nii
    example = Class.new { include Nii::Helpers }.new
    assert_nil example.nii(false)
    assert !example.nii?
    assert_raises { example.nii }
  end

  def test_explicit_nii
    example     = Class.new { include Nii::Helpers }.new
    context     = Nii::Context.new
    example.nii = context
    assert example.nii?

    assert_equal '1,530', example.localize(1530).to_s
    assert_equal '1,530', example.translate(1530).to_s

    context.lookup = Nii::Lookup::Memory.new { locale(:en) { namespace(:example) { add(:example, 'example message') } } }
    context.locale = :en

    assert_equal 'example message', example.translate(:example)
  end

  def test_to_nii_context
    example = Class.new do
      include Nii::Helpers
      def to_nii_context = Nii::Context.new(:en)
    end.new

    assert_equal 'en-US', example.nii.locale(true).to_s
  end

  def test_rack_env
    example = Struct.new(:env) { include Nii::Helpers }.new('PATH_INFO' => '/', 'HTTP_ACCEPT_LANGUAGE' => 'fr-CH,en')
    assert_equal 'fr-CH', example.nii.locale(true).to_s
  end

  def test_locale
    example = Struct.new(:locale) { include Nii::Helpers }.new('fr-CH')
    assert_equal 'fr-CH', example.nii.locale(true).to_s
  end

  def test_setup
    example_class = Class.new { include Nii::Helpers }
    Nii::Setup.new(example_class) { locale 'fr-CH' }
    assert_equal 'fr-CH', example_class.new.nii.locale(true).to_s
  end

  def test_predefined_nii
    context       = Nii::Context.new
    example_class = Class.new
    example_class.include Nii::Helpers[context]
    assert_equal context, example_class.new.nii
  end
end
