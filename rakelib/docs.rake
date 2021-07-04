require 'rake/clean'

task :docs do
  require 'nii/all'
  require 'docs'
  require 'erb'

  source_dir = Nii::LoadPath.new('src/docs')
  target_dir = Pathname.new('docs')

  source_dir.glob('**/*.erb') do |source|
     target   = source.relative_path.expand_path(target_dir).sub(/\.erb$/, '')
     document = Docs::Document.new(source)
     document.write(target) unless document.partial?
  end

  source_dir.lookup 'languages/_template.md.erb' do |path|
    Docs.languages.each do |language, data|
      document = Docs::Document::Language.new(path, data)
      document.write(target_dir + "languages/#{language}.md")
    end
  end
end
