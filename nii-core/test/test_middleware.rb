require_relative 'setup'

class TestMiddleware < Minitest::Test
  def build(...)
    @app = Proc.new do |env|
      context = env.fetch('nii.context')
      env['callback'].call(context)
      [200, {'Content-Type' => 'text/html'}, ['ok']]
    end
    @middleware = Nii::Middleware.new(@app, ...)
  end

  def request(env = {}, &callback)
    env['PATH_INFO'] ||= '/'
    env['METHOD']    ||= 'GET'
    env['callback']    = callback
    @middleware.call(env)
  end

  def setup = Nii::Config[Nii::Middleware] = nil
  alias_method :teardown, :setup

  def test_call
    build

    ran = false
    request { ran = true }
    assert ran
  end

  def test_no_config
    build
    request do |context|
      assert_equal 'und-001', context.locale.to_s
      assert context.config.empty?
    end
  end

  def test_simple_config
    build(available_locales: [:de, :en])

    response = request 'HTTP_ACCEPT_LANGUAGE' => 'fr,en' do |context|
      assert_equal 'en-US', context.locale.to_s
    end

    assert_equal 'de, en', response[1]['Content-Language']
  end

  def test_with_block
    build { locale_path }
    request 'PATH_INFO' => '/fr-CH' do |context|
      assert_equal 'fr-CH', context.locale.to_s
    end
  end

  def test_with_setup
    Nii::Setup.new(Nii::Middleware) { locale_path }
    build
    request 'PATH_INFO' => '/fr-CH' do |context|
      assert_equal 'fr-CH', context.locale.to_s
    end
  end
end
