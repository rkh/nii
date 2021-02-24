require 'rake/clean'
CLOBBER << 'data' << 'nii-core/data' << 'nii-extra-locales/data'

namespace :cldr do
  task :prepare do
    require 'nii/cldr'
    sh 'git submodule update --remote'
  end

  task locales: :prepare do
    repo = Nii::CLDR::Repository.new('vendor/cldr-json')
    repo.write('data', core: 'nii-core/data', extra: 'nii-extra-locales/data', calendars: 'nii-calendars/data')
  end

  task transforms: :prepare do
    transforms = Nii::CLDR::Transforms.new('vendor/cldr/common/transforms')
    transforms.write('data/core', 'nii-core/data')
  end

  task timezones: :prepare do
    timezones = Nii::CLDR::Timezones.new('vendor/cldr/common/bcp47/timezone.xml', 'vendor/cldr-json')
    timezones.write('data/core', 'nii-core/data')
  end

  task license: :prepare do
    Dir.glob('{*/,}data').each do |path|
      cp 'vendor/cldr-json/LICENSE', File.join(path, 'LICENSE')
    end
  end
end

task :astro do
  require 'zlib'
  require 'date'

  parse = Proc.new do |value|
    next value if value =~ /^\d+$/
    DateTime.parse(value, false, ::Date::GREGORIAN).to_time.to_i
  end

  Dir.glob('vendor/astro-data/**/*.tsv') do |file|
    content    = File.read(file).sub(/\A[^\n]+\n/, '').gsub(/[^\t\n]+/, &parse)
    compressed = Zlib.gzip(content, level: Zlib::BEST_COMPRESSION)
    target     = file.sub('vendor/astro-data', 'nii-calendars') + '.gz'
    FileUtils.mkdir_p File.dirname(target)
    File.write(target, compressed)
  end
end

task cldr: %i[cldr:prepare cldr:locales cldr:transforms cldr:timezones cldr:license astro]
