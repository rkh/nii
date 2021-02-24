require_relative 'setup'

class TestConfig < Minitest::Test
  def test_new
    assert_nil Nii::Config.new.foo
    assert_nil Nii::Config.new(foo: :bar).bar
    assert_equal(:bar, Nii::Config.new(foo: :bar).foo)
    assert_equal(:baz, Nii::Config.new(foo: {bar: :baz}).foo.bar)

    config = Nii::Config.new(foo: :bar)
    assert_equal(config, Nii::Config.new(config))
    assert config.respond_to?(:foo)
    assert config.respond_to?(:foo?)
    assert config.respond_to?(:bar)
    assert config.respond_to?(:bar?)
    assert !config.respond_to?(:bar=)

    assert_equal true,  config.foo?
    assert_equal false, config.bar?
  end

  def test_data
    assert_equal Nii::DATA, Nii::Config.new.data
    assert_equal :not_data, Nii::Config.new(data: :not_data).data
  end

  def test_for
    config = Nii::Config.new
    assert_equal config, config.for(Nii::Locale.new('de-DE'))
  end

  def test_applies_for
    assert Nii::Config.new.applies_for?(Nii::Locale.new('de-DE'))
  end

  def test_empty
    assert Nii::Config.new.empty?
    assert !Nii::Config.new(data: Nii::DATA).empty?
  end

  def test_dig
    config = Nii::Config.new(foo: Nii::Config.new(bar: { baz: 42 }))
    assert_equal 42, config.dig(:foo, :bar, :baz)
    assert_equal config.foo, config.dig(:foo)
    assert_nil config.dig(:fox, :bar, :baz)
  end

  def test_to_h
    assert_equal({foo: { bar: :baz }}, Nii::Config.new(foo: { bar: :baz }).to_h)
  end

  def test_extract
    config, arguments = Nii::Config.extract([:foo, { foo: :bar }, :bar, { foo: :baz}, Nii::Config.new(bar: :baz)])
    assert_equal(Nii::Config, config.class)
    assert_equal({foo: :baz, bar: :baz}, config.to_h)
    assert_equal([:foo, :bar], arguments)
  end
end
