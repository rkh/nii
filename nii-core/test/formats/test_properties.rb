require_relative '../setup'

class TestProperties < Minitest::Test
  def setup
    @context        = Nii::Context.new('en', namespace: 'example')
    @context.lookup = Nii::Lookup.new File.expand_path('properties', __dir__)
  end
end
