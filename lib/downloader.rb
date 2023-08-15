class Downloader
  DOWNLOAD_DIRECTORY = 'wallpapers'.freeze

  def self.call(url_aray)
    Dir.mkdir(DOWNLOAD_DIRECTORY) unless Dir.exist?(DOWNLOAD_DIRECTORY)

    url_aray.each do |wallpaper_url|
      filename = File.basename(wallpaper_url)
      full_path = File.join(DOWNLOAD_DIRECTORY, filename)

      File.open(full_path, 'wb') do |file|
        file.write(URI.parse(wallpaper_url).open.read)
      end

      puts "Downloaded: #{filename}"
    end
  end
end
