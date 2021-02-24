require_relative 'setup'

class TestLocale < Minitest::Test
  def test_language
    assert_equal 'de', Nii::Locale.new(language: 'de').language
    assert_equal 'de', Nii::Locale.new('de').language
    assert_equal 'de', Nii::Locale.new('de-DE').language
    assert_equal 'de', Nii::Locale.new('de-de').language
    assert_equal 'de', Nii::Locale.new('DE-DE').language
    assert_equal 'de', Nii::Locale.new('de-Latn-DE-1996-u-ca-gregory-x-formal').language
    assert_nil Nii::Locale.new.language
    assert_nil Nii::Locale.new(region: 'DE').language
    assert_nil Nii::Locale.new('root').language
    assert_nil Nii::Locale.new('und').language
    assert_nil Nii::Locale.new('und-Latn-DE-1996-u-ca-gregory-x-formal').language

    locale = Nii::Locale.new
    locale.language = 'DE'
    assert_equal 'de', locale.language
  end

  def test_region
    assert_equal 'DE',  Nii::Locale.new('de-DE').region
    assert_equal 'DE',  Nii::Locale.new('de-de').region
    assert_equal 'DE',  Nii::Locale.new('DE-DE').region
    assert_equal 'DE',  Nii::Locale.new('de-Latn-DE-1996-u-ca-gregory-x-formal').region
    assert_equal '001', Nii::Locale.new('de-Latn-001-1996-u-ca-gregory-x-formal').region
    assert_nil Nii::Locale.new('de').region
    assert_nil Nii::Locale.new.region
    assert_nil Nii::Locale.new('de-Latn-1996-u-ca-gregory-x-formal').region

    locale = Nii::Locale.new
    locale.region = 'de'
    assert_equal 'DE', locale.region
  end

  def test_fields
    code   = 'de-Latn-DE-1996-u-ca-islamic-cf-account-co-phonetic-cu-usd-em-text-fw-sat-hc-h11-ms-ussystem-nu-roman-rg-uszzzz-sd-debe-tz-deber-x-formal'
    locale = Nii::Locale.new(code)
    assert_equal 'de',       locale.language
    assert_equal 'Latn',     locale.script
    assert_equal 'DE',       locale.region
    assert_equal ['1996'],   locale.variants
    assert_equal 'islamic',  locale.calendar_algorithm
    assert_equal 'account',  locale.currency_format
    assert_equal 'phonetic', locale.collation
    assert_equal 'usd',      locale.currency
    assert_equal 'text',     locale.emoji_representation
    assert_equal 'sat',      locale.first_day_of_week
    assert_equal 'h11',      locale.hour_cycle
    assert_equal 'US',       locale.measurement_system
    assert_equal 'roman',    locale.numbering_system
    assert_equal 'US',       locale.region_override
    assert_equal 'debe',     locale.subdivision
    assert_equal 'deber',    locale.timezone
    assert_equal 'formal',   locale.formality
    assert_equal code,       locale.code
  end

  def test_code
    assert_equal 'de-DE',             Nii::Locale.new(language: 'de', region: 'de').code
    assert_equal 'de-Latn-DE',        Nii::Locale.new(language: 'de', region: 'de', script: 'latn').code
    assert_equal 'de-x-formal',       Nii::Locale.new(language: 'de', formality: 'formal').code
    assert_equal 'de-u-ms-ussystem',  Nii::Locale.new(language: 'de', measurement_system: 'US').code
    assert_equal 'de-DE-u-rg-uszzzz', Nii::Locale.new(language: 'de', region: 'de', region_override: 'us').code
    assert_equal 'de-DE',             Nii::Locale.new('de_de').code
  end

  def test_equality
    assert_equal Nii::Locale.new(language: 'de', region: 'de'), Nii::Locale.new('de', region: 'de')
    assert_equal Nii::Locale.new('de', region: 'de'), Nii::Locale.new('de-DE')
  end
end
