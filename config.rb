# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# GZIP and asset hash for easier caching
#activate :gzip
activate :asset_hash, :ignore => %r{\og5.png?\b}

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end

# Pretty URLs
activate :directory_indexes

configure :build do

  # Minify on build
  activate :minify_css
  activate :minify_html
  activate :minify_javascript

  # Protect emails
  activate :protect_emails

  # Create favicons
  activate :favicon_maker, :icons => {
     "_favicon_template.png" => [
       { icon: "apple-touch-icon-57x57-precomposed.png" },
       { icon: "apple-touch-icon-60x60-precomposed.png" },
       { icon: "apple-touch-icon-72x72-precomposed.png" },
       { icon: "apple-touch-icon-76x76-precomposed.png" },
       { icon: "apple-touch-icon-114x114-precomposed.png" },
       { icon: "apple-touch-icon-120x120-precomposed.png" },
       { icon: "apple-touch-icon-144x144-precomposed.png" },
       { icon: "apple-touch-icon-152x152-precomposed.png" },
       { icon: "apple-touch-icon-180x180-precomposed.png" },
       { icon: "favicon-32x32.png" },
       { icon: "favicon-96x96.png" },
       { icon: "favicon.png", size: "16x16" },
       { icon: "favicon-196x196.png" },
       { icon: "mstile-144x144.png", size: "144x144" }
     ]
  }
end
