require 'rspec'
require_relative '../lib/url_generator' # Підключаємо клас для тестування

RSpec.describe UrlGenerator do
  describe '#call' do
    it 'returns the correct URL for January 2023 and resolution 640x480' do
      args = ['--month', '012023', '--resolution', '640x480']
      url_generator = UrlGenerator.new(args)
      expected_url = 'https://www.smashingmagazine.com/2023/12/desktop-wallpaper-calendars-january-2023'

      expect(url_generator.call).to eql expected_url
    end

    it 'returns the correct URL for September 2022 and resolution 1920x1080' do
      args = ['--month', '092022', '--resolution', '1920x1080']
      url_generator = UrlGenerator.new(args)
      expected_url = 'https://www.smashingmagazine.com/2022/08/desktop-wallpaper-calendars-september-2022'

      expect(url_generator.call).to eql expected_url
    end
  end
end
