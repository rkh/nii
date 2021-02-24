require_relative '../setup'

class TestYAML < Minitest::Test
  def setup
    @context        = Nii::Context.new('en', namespace: 'example')
    @context.lookup = Nii::Lookup.new File.expand_path('yaml', __dir__)
  end
end
