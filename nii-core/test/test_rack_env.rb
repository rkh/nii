require_relative 'setup'

class TestRackEnv < Minitest::Test
  WithEnv     = Struct.new(:env)
  WithRequest = Struct.new(:request)

  def rack_env(*args)
    env = { 'PATH_INFO' => '/', 'SCRIPT_NAME' => '', 'REQUEST_METHOD' => 'GET' }
    args.each do |arg|
      arg = { arg['/'] ? 'PATH_INFO' : 'HTTP_ACCEPT_LANGUAGE' => arg } if arg.is_a? String
      env.merge! arg
    end
    env
  end

  def negotiate(*a, **c) = Nii::RackEnv[rack_env(*a), c].context
  def locale(...)        = negotiate(...).locale(true)
  def preference(...)    = negotiate(...).locale_preference

  def disable_rack
    return unless defined? ::Rack
    @rack = ::Rack
    Object.send(:remove_const, :Rack)
    yield if block_given?
  end

  def enable_rack
    return if defined? ::Rack
    require 'rack'
    teardown
    yield if block_given?
  end

  def teardown
    ::Rack ||= @rack if @rack
  end

  def test_prepare
    config   = Nii::Config.new(foo: :bar)
    prepared = Nii::RackEnv.prepare(config)
    first    = prepared.call rack_env
    second   = prepared.call rack_env
    assert(first != second)
    assert_equal(first.config, second.config)
  end

  def test_prepare_with_rack    = enable_rack  { test_prepare }
  def test_prepare_without_rack = disable_rack { test_prepare }

  def test_detection
    assert_nil Nii::RackEnv[nil]
    assert_nil Nii::RackEnv[Object.new]
    assert_nil Nii::RackEnv[WithEnv.new]
    assert_nil Nii::RackEnv[WithRequest.new]
    assert_nil Nii::RackEnv[WithRequest.new(WithEnv.new)]

    recursive     = WithEnv.new
    recursive.env = recursive
    assert_nil Nii::RackEnv[recursive]

    assert_instance_of Nii::RackEnv, Nii::RackEnv[rack_env]
    assert_instance_of Nii::RackEnv, Nii::RackEnv[WithEnv.new(rack_env)]
    assert_instance_of Nii::RackEnv, Nii::RackEnv[WithRequest.new(WithEnv.new(rack_env))]

    assert_equal :bar, Nii::RackEnv[rack_env, foo: :bar].config.foo
  end

  def test_detection_with_rack    = enable_rack  { test_detection }
  def test_detection_without_rack = disable_rack { test_detection }

  def test_call
    result = Nii::RackEnv.new(nil)
    assert_equal result, result.call(rack_env)
    assert_raises { result.call(rack_env) }
  end

  def test_call_with_rack    = enable_rack  { test_call }
  def test_call_without_rack = disable_rack { test_call }

  def test_accept_language
    assert_equal 'und-001', locale.to_s
    assert_equal 'de-DE',   locale('de').to_s
    assert_equal 'de-DE',   locale('de,en').to_s
    assert_equal 'en-US',   locale('de;q=0.3,en;q=0.8').to_s
    assert_equal 'en, de',  preference('de;q=0.3,en;q=0.8').to_s

    assert_equal 'und-001', locale('de',     language_header: false).to_s
    assert_equal '',        preference('de', language_header: false).to_s

    assert_equal 'und-001', locale('de', language_header: 'X-Language').to_s
    assert_equal 'de-DE',   locale({'HTTP_X_LANG' => 'de'}, language_header: 'X-Lang').to_s
    assert_equal 'und-001', locale({'HTTP_X_LANG' => 'de'}).to_s
  end

  def test_accept_language_with_rack    = enable_rack  { test_accept_language }
  def test_accept_language_without_rack = disable_rack { test_accept_language }

  def test_domains
    enable_rack

    setup = Nii::Setup.new(Nii::Middleware) do
      domain('example.com') { locale 'en' }
      domain('beispiel.de') { locale 'de' }
    end

    env = Nii::RackEnv.new(setup.config, rack_env('fr', 'HTTP_HOST' => 'example.com'))
    assert_equal 'en-US', env.context.locale.to_s

    env = Nii::RackEnv.new(setup.config, rack_env('fr', 'HTTP_HOST' => 'beispiel.de'))
    assert_equal 'de-DE', env.context.locale.to_s
  end

  def test_paths
    assert_equal 'und-001', locale('/de').to_s
    assert_equal 'und-001', locale(locale_path: true).to_s
    assert_equal 'de-DE',   locale('/de', locale_path: true).to_s
    assert_equal 'de-AT',   locale('/de', 'de-AT', locale_path: true).to_s
    assert_equal 'de-AT',   locale('/de/example', 'de-AT', locale_path: true).to_s
    assert_equal 'de-DE',   locale('/de-DE', 'de-AT', locale_path: true).to_s
    assert_equal 'de-DE',   locale('/de-DE/example', 'de-AT', locale_path: true).to_s
  end

  def test_remove_path
    env = Nii::RackEnv[rack_env('/de/example'), locale_path: true].env
    assert_equal '/example', env['PATH_INFO']
    assert_equal '/de', env['SCRIPT_NAME']

    env = Nii::RackEnv[rack_env('/de/example', 'SCRIPT_NAME' => '/prefix'), locale_path: true].env
    assert_equal '/example', env['PATH_INFO']
    assert_equal '/prefix/de', env['SCRIPT_NAME']

    env = Nii::RackEnv[rack_env('/de/example', 'SCRIPT_NAME' => '/prefix'), locale_path: true, remove_locale_path: false].env
    assert_equal '/de/example', env['PATH_INFO']
    assert_equal '/prefix', env['SCRIPT_NAME']
  end

  def test_ignore
    assert !Nii::RackEnv.new({}).ignore?('/path')
    assert Nii::RackEnv.new(ignore_paths: ['/path']).ignore?('/path')
  end
end
