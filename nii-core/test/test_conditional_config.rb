require_relative 'setup'

class TestConditionalConfig < Minitest::Test
  def setup
    @a = Nii::ConditionalConfig.new(nil, foo: :bar)
    @b = Nii::ConditionalConfig.new(Nii::LocalePreference.new('de-DE', 'de-AT'), foo: :baz)
    @c = Nii::ConditionalConfig.new(Nii::Locale.new('de'), {}, @b, @a)
    @d = Nii::ConditionalConfig.new(Nii::Locale.new('en-US'), foo: :bar)
    @e = Nii::ConditionalConfig.new(nil, {}, @c, @d)
    @f = Nii::ConditionalConfig.new(Nii::Locale.new('en'), foo: :baz)
  end

  def test_for
    assert_equal @a, @a.for('en')
    assert_equal @a, @a.for('de')
    assert_equal @a, @a.for('de-DE')
    assert_equal @a, @a.for('de-CH')

    assert_nil @b.for('en')
    assert_nil @b.for('de')
    assert_nil @b.for('de-CH')
    assert_equal @b, @b.for('de-DE')
    
    assert_nil @c.for('en')
    assert_equal @a, @c.for('de')
    assert_equal @b, @c.for('de-DE')
    assert_equal @a, @c.for('de-CH')
  end

  def test_applies_for
    assert  @a.applies_for?(Nii::Locale.new('de-DE'))
    assert  @b.applies_for?(Nii::Locale.new('de-DE'))
    assert  @c.applies_for?(Nii::Locale.new('de-DE'))
    assert  @a.applies_for?(Nii::Locale.new('de-CH'))
    assert !@b.applies_for?(Nii::Locale.new('de-CH'))
    assert  @c.applies_for?(Nii::Locale.new('de-CH'))
    assert  @a.applies_for?(Nii::Locale.new('en-US'))
    assert !@b.applies_for?(Nii::Locale.new('en-US'))
    assert !@c.applies_for?(Nii::Locale.new('en-US'))
  end

  def test_merge
    assert_equal :bar, @a.foo
    assert_equal :baz, @b.foo

    assert_equal :bar, @c.for('de-CH').foo
    assert_equal :baz, @c.for('de-DE').foo
    assert_equal :bar, @e.for('de-CH').foo
    assert_equal :bar, @e.for('en-US').foo
    assert_equal :baz, @e.for('de-DE').foo

    assert_equal :baz, @a.merge(foo: :baz).foo
    assert_equal :bar, @b.merge(foo: :bar).foo
    assert_equal :baz, @c.merge(foo: :baz).foo
    assert_equal :baz, @c.merge(foo: :baz).for('de-CH').foo
    assert_equal :bar, @e.merge(foo: :bar).for('de-DE').foo

    assert_equal :baz, @c.for('de-CH').merge(foo: :baz).foo

    assert_equal :baz, @a.merge(Nii::Config.new(foo: :baz)).foo
    assert_equal :bar, @b.merge(Nii::Config.new(foo: :bar)).foo
    assert_equal :baz, @c.merge(Nii::Config.new(foo: :baz)).foo
    assert_equal :baz, @c.merge(Nii::Config.new(foo: :baz)).for('de-CH').foo
    assert_equal :bar, @e.merge(Nii::Config.new(foo: :bar)).for('de-DE').foo

    assert_equal :baz, @a.merge(Nii::ConditionalConfig.new(nil, foo: :baz)).foo
    assert_equal :bar, @b.merge(Nii::ConditionalConfig.new(nil, foo: :bar)).foo
    assert_equal :baz, @c.merge(Nii::ConditionalConfig.new(nil, foo: :baz)).foo
    assert_equal :baz, @c.merge(Nii::ConditionalConfig.new(nil, foo: :baz)).for('de-CH').foo
    assert_equal :bar, @e.merge(Nii::ConditionalConfig.new(nil, foo: :bar)).for('de-DE').foo
    
    assert_equal :baz, @a.merge(@b).foo
    assert_equal :baz, @a.merge(@b).for('de-DE').foo
    assert_nil @a.merge(@b).for('de-CH')

    assert_equal :baz, @e.merge(@f).for('en-US').foo
    assert_nil @e.merge(@f).for('de-DE')

    assert_equal :baz, @d.merge(@f).foo
    assert_nil @d.merge(@f).for('en')

    config = Nii::Config.new(foo: :bar).merge(@b)
    assert_equal :bar, config.foo
    assert_equal :baz, config.for('de-DE').foo
  end
end
