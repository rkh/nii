require_relative '../setup'

class TestJSON < Minitest::Test
  def setup
    @context        = Nii::Context.new('en', namespace: 'example')
    @context.lookup = Nii::Lookup.new File.expand_path('json', __dir__)
  end
end
