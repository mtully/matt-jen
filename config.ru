require 'toto'

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images', '/favicon.ico', '/apple-touch-icon.png', '/404.html'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

toto = Toto::Server.new do
  
  set :author,    "Matthew Tully"                           # blog author
  set :title,     '2OH3'                                    # site title
  set :root,      "index"                                   # page to load on /
  set :date,      lambda {|now| now.strftime("%b %d %Y") }  # date format for articles
  set :markdown,  :smart                                    # use markdown + smart-mode
  set :summary,   :max => 1000, :delim => /~\n/             # length of article summary and delimiter
  set :ext,       'md'                                      # file extension for articles
  set :cache,      28800                                    # cache duration, in seconds
  set :url,       'http://2OH3.com'
  # set :error,      File.read("public/404.html")  
  

end

run toto