require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  ENV['COVERAGE'] = '1'
  t.test_files = FileList["*/test/**/test_*.rb"]
end

task default: :test
