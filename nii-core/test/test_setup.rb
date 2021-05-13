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

  def test_eager_load
    Nii::Setup.new.eager_load :en unless ENV['FAST_TEST']
  end
end
