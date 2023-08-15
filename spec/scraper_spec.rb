require_relative '../lib/scraper'

RSpec.describe Scraper do
  describe '#call' do
    it 'returns an array links for the specified resolution' do
      url = 'https://www.example.com/wallpapers'
      resolution = '1920x1080'
      html = <<-HTML
        <a href="link1" title="Wallpaper 1 - 1920x1080">Wallpaper 1</a>
        <a href="link2" title="Wallpaper 2 - 1280x720">Wallpaper 2</a>
        <a href="link3" title="Wallpaper 3 - 1920x1080">Wallpaper 3</a>
      HTML
      allow(URI).to receive(:parse).and_return(double('response', open: html))

      result = Scraper.call(url, resolution)
      expect(result).to eql %w[link1 link3]
    end

    it 'returns an empty array if no download links are found for the specified resolution' do
      url = 'https://www.example.com/wallpapers'
      resolution = '1280x720'
      html = <<-HTML
        <a href="link1" title="Wallpaper 1 - 1920x1080">Wallpaper 1</a>
        <a href="link2" title="Wallpaper 2 - 1920x1080">Wallpaper 2</a>
        <a href="link3" title="Wallpaper 3 - 1920x1080">Wallpaper 3</a>
      HTML
      allow(URI).to receive(:parse).and_return(double('response', open: html))

      result = Scraper.call(url, resolution)
      expect(result).to eql []
    end
  end
end
