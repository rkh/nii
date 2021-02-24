require_relative 'setup'

class TestData < Minitest::Test
  def setup
    @data = Nii::Data.new File.expand_path('../data', __dir__)
  end

  def test_source
    assert_equal({'gem' => 'nii-core', 'path' => '.'}, @data.source('und'))
    assert_equal({'gem' => 'nii-core', 'path' => '.'}, @data.source('root'))
    assert_equal({'gem' => 'nii-core', 'path' => './en/en-US'}, @data.source('en-US'))
    assert_equal({'gem' => 'nii-extra-locales', 'path' => './gsw/gsw-CH', 'require' => 'nii/extra_locales'}, @data.source('gsw-CH'))
  end

  def test_locale_available?
    assert @data.locale_available?('de')
    assert @data.locale_available?('und')
    assert @data.locale_available?('und')
    assert !@data.locale_available?('gsw')
    assert !@data.locale_available?('xyz')
  end

  def test_locale_known?
    assert @data.locale_known?('de')
    assert @data.locale_known?('und')
    assert @data.locale_known?('und')
    assert @data.locale_known?('gsw')
    assert !@data.locale_known?('xyz')
  end

  def test_known_locales
    assert_equal Array, @data.known_locales.class
    assert @data.known_locales.include?('de')
    assert @data.known_locales.include?('root')
    assert @data.known_locales.include?('gsw')
    assert !@data.known_locales(false).include?('root')
  end

  def test_available_locales
    assert @data.available_locales.include?('de')
    assert @data.available_locales.include?('root')
    assert !@data.available_locales.include?('gsw')
    assert !@data.available_locales(false).include?('root')
  end

  def test_locale_data
    assert_equal "“", @data.locale_data(:root, :info, :delimiters, :quotation_start)
    assert_equal "„", @data.locale_data(:de,   :info, :delimiters, :quotation_start)
  end

  def test_territory_known?
    assert @data.territory_known?('001')
    assert @data.territory_known?('US')
    assert !@data.territory_known?('XX')
  end

  def territories
    assert_equal Array, @data.territories.class
    assert @data.territories.include?('US')
  end

  def test_territory_data
    assert_equal 'metric', @data.territory_data(:DE, :measurement_system)
    assert_equal 'US',     @data.territory_data(:US, :measurement_system)
  end

  def test_resolve_alias
    assert_equal 'und',   @data.resolve_alias('root')
    assert_equal 'de',    @data.resolve_alias('ger')
    assert_equal 'de-AT', @data.resolve_alias('de-AT')
  end

  def test_numbering_systems
    assert_equal Array, @data.numbering_systems.class
    assert @data.numbering_systems.include?('latn')
  end

  def test_numbering_system_known?
    assert @data.numbering_system_known?('latn')
    assert !@data.numbering_system_known?('maya')
  end

  def test_numbering_system
    assert_equal Nii::NumberingSystem::Numeric,     @data.numbering_system('latn').class
    assert_equal Nii::NumberingSystem::Algorithmic, @data.numbering_system('roman').class
  end

  def test_calendar_known?
    assert @data.calendar_known?('gregorian')
    assert !@data.calendar_known?('julian')
  end

  def test_calendar
    assert_equal Nii::Calendar::Gregorian, @data.calendar('gregorian').class
  end

  unless ENV['FAST_TEST']
    Nii::DATA.known_locales(false).each do |locale|
      define_method("test_#{locale}") do
        assert Nii::DATA.locale_data(locale, :info, :layout)
      end
    end
  end
end
