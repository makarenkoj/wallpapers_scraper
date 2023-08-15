require './lib/url_generator'
require './lib/scraper'
require './lib/downloader'

url = UrlGenerator.new(ARGV)
url = url.call
resolution = ARGV.last
url_aray = Scraper.call(url, resolution)
Downloader.call(url_aray)
