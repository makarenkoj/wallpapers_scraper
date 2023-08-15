class UrlGenerator
  BASE_URL = 'https://www.smashingmagazine.com/'.freeze

  MONTH = {
    '01': 'january',
    '02': 'february',
    '03': 'march',
    '04': 'april',
    '05': 'may',
    '06': 'june',
    '07': 'july',
    '08': 'august',
    '09': 'september',
    '10': 'october',
    '11': 'november',
    '12': 'december'
  }.freeze

  MONTH_DIGIT = {
    '01': '12',
    '02': '01',
    '03': '02',
    '04': '03',
    '05': '04',
    '06': '05',
    '07': '06',
    '08': '07',
    '09': '08',
    '10': '09',
    '11': '10',
    '12': '11'
  }.freeze

  def initialize(args)
    @options = parse_args(args)
  end

  def call
    "#{BASE_URL}#{year}/#{month_digit}/desktop-wallpaper-calendars-#{month}-#{year}"
  end

  private

  def parse_args(args)
    options = {}

    options[:month] = args[1]
    options[:resolution] = args[-1]

    options
  end

  def month
    MONTH[:"#{@options[:month][0..1]}"]
  end

  def month_digit
    MONTH_DIGIT[:"#{@options[:month][0..1]}"]
  end

  def year
    @options[:month][2..5]
  end
end
