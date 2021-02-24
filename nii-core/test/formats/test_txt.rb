require_relative '../setup'

class TestTXT < Minitest::Test
  def setup
    @context        = Nii::Context.new('en', namespace: 'example')
    @context.lookup = Nii::Lookup.new File.expand_path('txt', __dir__)
  end
end
