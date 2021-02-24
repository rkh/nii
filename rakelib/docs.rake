namespace :docs do
  task :prepare do
    require 'yard'
    files  = Dir.glob("nii-*/lib/nii/setup/**/*.rb").sort
    files += Dir.glob("nii-*/lib/nii/*/setup.rb").sort
    YARD::Tags::Library.define_tag('default value', :default, nil)
    YARD.parse files
    YARD::Registry.load_all
  end

  task setup: :prepare do
    require 'setup_parser'
    setup = SetupParser.new

    setup.load 'Nii::Setup::Vanilla',    scope: :vanilla,    gem: 'nii-core'
    setup.load 'Nii::Setup::DSL',        scope: :everywhere, gem: 'nii-core'
    setup.load 'Nii::Setup::Locale',     scope: :locale,     gem: 'nii-core'
    setup.load 'Nii::Setup::RouteScope', scope: :domain,     gem: 'nii-core'
    setup.load 'Nii::Setup::Middleware', scope: :middleware, gem: 'nii-core'
    setup.load 'Nii::Setup::Global',     scope: :global,     gem: 'nii-global'
    setup.load 'Nii::I18n::Setup',       scope: :i18n,       gem: 'nii-i18n'
    setup.load 'Nii::Rails::Setup',      scope: :rails,      gem: 'nii-rails'
    setup.load 'Nii::Sinatra::Setup',    scope: :sinatra,    gem: 'nii-sinatra'

    File.write('docs/setup_options.md',      setup.to_markdown)
    File.write('web/data/setup_options.yml', setup.to_yaml)
  end
end
