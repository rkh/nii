source 'https://rubygems.org'

path '.' do
  gem 'nii'
  gem 'nii-core'
  gem 'nii-extra-locales'
  gem 'nii-global'
  gem 'nii-historic'
  gem 'nii-i18n'
  gem 'nii-rbnf'
  gem 'nii-sinatra'
  gem 'nii-units'
  gem 'nii-xml'
end

group :development do
  gem 'rake', '~> 13.0'
  gem 'nii-cldr', path: 'tools'
  gem 'yard', git: 'https://github.com/lsegal/yard.git', branch: 'main' # can switch to gem once 0.9.27 has been released
end

group :test do
  gem 'minitest', '~> 5.14'
  gem 'simplecov'
end

group :benchmark do
  gem 'i18n'
  gem 'fast_gettext'
  gem 'gettext'
  gem 'r18n-core'
  gem 'profile'
  gem 'concurrent-ruby-ext'
  gem 'activesupport'
  gem 'twitter_cldr'
  gem 'rails-i18n'
  gem 'mini_i18n'
end
