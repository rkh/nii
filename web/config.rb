# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :directory_indexes
activate :syntax

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, with_toc_data: true, tables: true, lax_spacing: true

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

data.setup_options['methods'].each do |method|
  proxy "/setup/#{method.name}/index.html", "/setup/method.html",
    locals: { option: method },
    data: { title: "Setup API – #{method.name.split('_').map(&:capitalize).join(' ')}" },
    ignore: true
end

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end
