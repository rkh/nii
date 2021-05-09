require_relative '../setup'

class TestStringFormatter < Minitest::Test
  def context     = Nii::Context.new(@locale ||= :en)
  def format(...) = context.format(...)
  
  def test_no_options
    assert_equal 'example',                format('example')
    assert_equal 'example',                format(:example)
    assert_equal '&lt;example&gt;',        format('<example>')
    assert_equal '&lt;example&gt;',        format('&lt;example&gt;')
    assert_equal '<example>',              format(context.html('<example>'))
    assert_equal '<example?>',             format(context.html('<example?>'))
    assert_equal '<a>&lt;example&gt;</a>', format(context.html('<a>?</a>', '<example>'))
    assert_equal '5<sup>th</sup>',         format('5<sup>th</sup>')
  end

  def test_escape_html
    assert_equal '<example>', format('<example>', escape_html: false)
  end

  def test_bidi
    assert_equal "\u2068example\u2069",           format('example', bidi: true)
    assert_equal '<bdi dir="auto">example</bdi>', format('example', bidi: :html)
    assert_equal "\u202Dexample\u202C",           format('example', bidi: { format: :utf,  instruction: :override })
    assert_equal '<bdo dir="ltr">example</bdo>',  format('example', bidi: { format: :html, instruction: :override })
    assert_equal "example",                       format('example', bidi: { format: :utf,  instruction: :embed })
    assert_equal "\u202Aexample\u202C",           format('example', bidi: { format: :utf,  instruction: :embed, direction: 'left-to-right' })
    assert_equal '<bdi dir="ltr">example</bdi>',  format('example', bidi: { format: :html, instruction: :embed, direction: 'left-to-right' })
  end

  def test_as_number          = assert_equal('1,530.5',             format('1530.5',   as: :number))
  def test_as_calendar        = assert_equal('Chinese Calendar',    format('chinese',  as: :calendar))
  def test_as_collation       = assert_equal('Standard Sort Order', format('standard', as: :collation))
  def test_as_currency        = assert_equal('US Dollar',           format('usd',      as: :currency))
  def test_as_key             = assert_equal('Currency',            format('currency', as: :key))
  def test_as_language        = assert_equal('French',              format('fr',       as: :language))
  def test_as_territory       = assert_equal('United States',       format('us',       as: :territory))
  def test_as_territory_short = assert_equal('US',                  format('us',       as: :territory, style: :short))
  def test_as_region          = assert_equal('United States',       format('us',       as: :region))
  def test_as_country         = assert_equal('United States',       format('us',       as: :country))
  def test_as_script          = assert_equal('Hebrew',              format('Hebr',     as: :script))
  def test_as_unit            = assert_equal('inches',              format('inch',     as: :unit))
  def test_as_variant         = assert_equal('Eastern Armenian',    format('arevela',  as: :variant))

  def test_default
    assert_equal 'missing',       format('missing', as: :region)
    assert_equal 'fallback',      format('missing', as: :region, default: 'fallback')
    assert_equal 'United States', format('us', as: :region, default: 'fallback')
    assert_nil format('missing', as: :region, default: nil)
  end
end
