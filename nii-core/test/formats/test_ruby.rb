require_relative '../setup'

class TestRuby < Minitest::Test
  def setup
    @context        = Nii::Context.new('en', namespace: 'example')
    @context.lookup = Nii::Lookup.new File.expand_path('ruby', __dir__)
  end
end
