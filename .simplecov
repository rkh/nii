if ENV['COVERAGE']
  SimpleCov.start do
    Dir.glob('*/lib') do |path|
      add_filter "#{File.dirname(path)}/test/"
      add_group File.dirname(path), path
    end
  end
end
