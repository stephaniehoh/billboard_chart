require "open-uri"
require "nokogiri"
require "colored"
#encoding: utf-8

class BillboardChartScraper
  attr_accessor :scraped_data

  def initialize(url)
    @scraped_data = Nokogiri::HTML(open(url))
    top_ten
  end

  # =============== Scrape Methods ============= #

  def get_artists
    @scraped_data.css(".chart-row h3").collect {|artist| artist.text.strip!}
  end

  def get_singles
    @scraped_data.css(".chart-row h2").collect {|single| single.text.strip!}
  end

  def merge_artists_and_singles
    get_artists.zip(get_singles)
  end

  # =============== Display Methods ============= #

  def top_ten
    print_line
    puts "      ♫  Top 10 Billboard Hot 100 Singles Chart: ♫    "
    puts "                  (#{DateTime.now.strftime('%m/%d/%Y')})             ".red
    puts "\n"
    rank = 0
    merge_artists_and_singles.each do |artist, single|
      rank += 1
      puts "#{rank}. #{artist} - #{single}"
      print_line if (rank % 10 == 0)
    end
  end

  def print_line
    puts "\n"
    puts "✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭".yellow
    puts "\n"
  end

end
