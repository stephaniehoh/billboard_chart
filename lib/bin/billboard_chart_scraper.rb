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
    @scraped_data.css("p.chart_info a").collect {|artist| artist.text}
  end

  def get_singles
    @scraped_data.css("h1").collect {|single| single.text}[1..10]
  end

  def merge_artists_and_singles
    Hash[get_artists.zip(get_singles)]
  end

  # =============== Display Methods ============= #
  
  def top_ten
    puts "\n"
    puts "✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭".yellow
    puts "\n"
    puts "      ♫  Top 10 Billboard Hot 100 Singles Chart: ♫    "
    puts "                  (#{DateTime.now.strftime('%m/%d/%Y')})             ".red
    puts "\n"
    i = 0
    while i < 10
      merge_artists_and_singles.each do |artist, single|
        puts "#{i+1}. #{artist} - #{single}"
        i += 1
      end
        puts "\n"
        puts "✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭ ✭".yellow
        puts "\n"
    end
  end

end