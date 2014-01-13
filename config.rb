###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# helpers do
#   def friendly_url(faq)
#     faq["t"].gsub(/[\s\?]/, " " => "_", "?" => "")
#   end
# end

# set :haml, { :ugly => true, :format => :html5 }
# data.faq.questions.each do |faq|
#   page "/lichtvis/#{friendly_url(faq)}.html", :proxy => "faq_template.html", :layout => "knowledge_base", :ignore => true do
#     @faq = faq
#   end
#   page "/javascripts/#{faq}.json"
# end

portfolio_items = sitemap.where(:tag => "portfolio")

proxy "portfolio.html", "/portfolio_template.html", :locals => {:bla => "bla", :items => portfolio_items}

class HtmlFiles < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
    app.after_build do |builder|
      puts "Oude blog in orde zetten"
      system "rm -R tmp/blog"
      puts (system "cp -R source/blog tmp/blog")
    end
  end
end
::Middleman::Extensions.register(:html_files, HtmlFiles)

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'
activate :directory_indexes
set :build_dir, "tmp"

activate :html_files

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
