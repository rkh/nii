module NiiGemspec
  extend self

  def path
    Dir.pwd
  end

  def name
    File.basename(path)
  end

  def new(summary, depend_on_core = true)
    Gem::Specification.new(name) do |spec|
      spec.version               = version
      spec.summary               = summary
      spec.author                = 'Konstantin Haase'
      spec.email                 = 'nii@rkh.im'
      spec.homepage              = 'https://github.com/rkh/nii'
      spec.license               = 'MIT'
      spec.files                 = Dir['{lib,data}/**/*', 'README.md', 'LICENSE']
      spec.required_ruby_version = '~> 3.0'
      spec.metadata              = {
        'source_code_uri'        => spec.homepage,
        'homepage_uri'           => spec.homepage,
        'bug_tracker_uri'        => spec.homepage + '/issues',
        'documentation_uri'      => 'https://www.rubydoc.info/gems/lumise'
        # 'changelog_uri'
      }
      spec.add_runtime_dependency 'nii-core', version if depend_on_core
      yield spec if block_given?
    end
  end

  def version
    @version ||= File.read("#{__dir__}/../../VERSION").strip
  end
end
