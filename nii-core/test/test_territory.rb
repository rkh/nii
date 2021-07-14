require_relative 'setup'

class TestTerritory < Minitest::Test
  def setup                 = @territory = Nii::Territory['MEX'] # MEX is an alias of MX
  def test_code             = assert_equal('MX', @territory.code)
  def test_within           = assert(@territory.within?('013'))
  def test_all              = assert(Nii::Territory.all.include?(@territory))
  def test_deconstruct      = assert((@territory in Nii::Territory(/^M/)))
  def test_deconstruct_keys = assert((@territory in Nii::Territory(measurement_system: 'metric')))

  def test_currency
    assert_equal Nii::Currency['MXN'], @territory.currency
    assert_equal Nii::Currency['MXN'], @territory.currency(Date.today)
    assert_equal Nii::Currency['MXP'], @territory.currency(before: 1900)
    assert_equal Nii::Currency['MXV'], @territory.currency(before: 1800)
  end

  def test_currencies
    assert_equal ['MXN'],               @territory.currencies.map(&:code)
    assert_equal ['MXN', 'MXP', 'MXV'], @territory.currencies(true).map(&:code)
    assert_equal ['MXP', 'MXV'],        @territory.currencies(1800..1900).map(&:code)
  end
end
