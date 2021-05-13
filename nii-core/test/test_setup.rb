require_relative 'setup'

class TestSetup < Minitest::Test
  def configure(&block) = @setup = Nii::Setup.new(&block)
  def context(...) = Nii::Context.new(@setup, ...)
  def config = @setup.config

  def test_conditional
    configure do
      measurement_system 'US'
      on('en-US') { measurement_system 'metric' }
    end

    assert !context('en-DE').measurement_system.metric?
    assert context('en-US').measurement_system.metric?
    assert_equal 'en-US', config.available_locales.to_s
  end

  def test_block_argument
    configure do |config|
      assert_instance_of TestSetup, self
      config.available_locales = ['en', 'fr']
    end

    assert_equal 'en, fr', config.available_locales.to_s
  end

  def test_nested_setups
    example = Class.new { include Nii::Helpers }

    configure do
      available_locales 'ar', 'he'
      setup(example) { fallback_locale 'en' }
    end

    assert_nil config.fallback_locales
    assert_equal ['en'],   Nii::Config[example].fallback_locales
    assert_equal 'ar, he', Nii::Config[example].available_locales.to_s

    assert_raises do
      configure { setup(example) { setup(example) { } } }
    end

    assert_raises do
      configure do
        setup(example) { }
        setup(example) { }
      end
    end
  end

  def test_eager_load
    Nii::Setup.new.eager_load :en unless ENV['FAST_TEST']
  end
end
