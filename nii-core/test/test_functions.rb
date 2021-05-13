require_relative 'setup'

class TestFunctions < Minitest::Test
  def invoke(...) = Nii::Context.new(:en).call_function(...).to_s
  
  def test_bidi       = assert_equal("\u2068example\u2069", invoke(:bidi, 'example'))
  def test_capitalize = assert_equal('Example', invoke(:capitalize, 'example'))
  def test_format     = assert_equal('Germany', invoke(:format, 'de', as: 'country'))
  def test_html       = assert(invoke(:html, '<a>').html_safe?)
  def test_list       = assert_equal('a and b', invoke(:list, 'a', 'b'))
  def test_offset     = assert_equal('3', invoke(:offset, 1, '2'))
  def test_number     = assert_equal('V', invoke(:number, 5, numberingSystem: 'roman'))
  def test_tone       = assert_equal('avoid', invoke(:tone))

  def test_measurement_system
    assert_equal 'US',        invoke(:measurement_system)
    assert_equal 'US',        invoke(:measurement_system, 'temperature')
    assert_equal 'US-Letter', invoke(:measurement_system, 'paper_size')
  end
end
