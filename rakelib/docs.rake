require 'rake/clean'

namespace :docs do
  task :prepare do
    require 'nii/all'
    require 'docs'
    require 'erb'

    $source_dir = Nii::LoadPath.new('src')
    $target_dir = Pathname.new('.')
  end

  task main: :prepare do
    $source_dir.glob('**/*.erb') do |source|
      target   = source.relative_path.expand_path($target_dir).sub(/\.erb$/, '')
      document = Docs::Document.new(source)
      document.write(target) unless document.partial?
    end
  end

  task languages: :prepare do
    $source_dir.lookup 'docs/languages/_template.md.erb' do |path|
      Docs.languages.each do |language, data|
        document = Docs::Document::Language.new(path, data)
        document.write($target_dir + "docs/languages/#{language}.md")
      end
    end
  end

  task all: [:prepare, :main, :languages]
end

task docs: 'docs:all'
