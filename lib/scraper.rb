require 'open-uri'
require 'nokogiri'

class Scraper
  def self.call(url, resolution)
    wallpapers = []
    page = Nokogiri::HTML(URI.parse(url).open)

    page.css('a').each do |download_link|
      wallpapers << download_link['href'] if download_link['title']&.split('-')&.last&.strip == resolution
    end

    wallpapers
  end
end
