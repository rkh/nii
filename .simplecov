if ENV['COVERAGE']
  SimpleCov.start do
    enable_coverage :branch
    primary_coverage :branch

    Dir.glob('*/lib') do |path|
      add_filter "#{File.dirname(path)}/test/"
      add_group File.dirname(path), path
    end
  end
end
