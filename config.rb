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
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# ready do
#   portfolio_items = sitemap.where(:tag.include => "portfolio").all

#   page "portfolio/index.html", :proxy => "/portfolio_template.html", :ignore => true do 
#     @portfolio_items = portfolio_items
#       content_for(:title, "Wat we doen, portfolio")
#       content_for(:subtitle, "Passioneel werken we webapplicaties uit met sterke focus op het <strong>proces</strong>, <strong>eenvoud</strong> en <strong>effectiviteit</strong>.")
#   end

#   portfolio_items.each do |portfolio_item|
#     page "#{portfolio_item.url}index.html", :proxy => "/portfolio_item_template.html", :ignore => true do
#       @portfolio_item = portfolio_item
#       content_for(:title, @portfolio_item.data[:title])
#       content_for(:subtitle, @portfolio_item.data[:subtitle])
#       # portfolio_items.delete(portfolio_item)
#       @other_projects = portfolio_items.sample(3)
#     end
#   end
# end


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
