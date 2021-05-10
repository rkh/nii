require_relative 'setup'

class TestSlim < Minitest::Test
  class MyApp
    include Nii::Helpers
    def value = 1530
  end

  def test_formatting
    template = Slim::Template.new { "span data-value=value = value" }
    assert_equal '<span data-value="1530">1,530</span>', template.render(nil, value: 1530)
    assert_equal '<span data-value="1530">1.530</span>', template.render(nil, value: 1530, locale: :de)
    assert_equal '<span data-value="1530">1.530</span>', template.render(nil, value: 1530, nii: :de)
    assert_equal '<span data-value="1530">1.530</span>', template.render(nil, value: 1530, nii: Nii::Context.new(:de))
  end

  def test_formatting_with_scope
    app      = MyApp.new
    app.nii  = Nii::Context.new(:ar)
    template = Slim::Template.new { "span data-value=value = value" }
    assert_equal '<span data-value="1530">١٬٥٣٠</span>', template.render(app)
  end
end
