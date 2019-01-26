class WordCount
  def self.count_a(text)
    word_count = {}

    text.split.map(&:downcase).each do |word|
      word_count[word] ||= 0
      word_count[word] += 1
    end

    word_count
  end

  def self.count_b(text)
    word_count = Hash.new do |hash, missing_key|
      hash[missing_key] = 0
    end

    # we can get default value:
    # pr = word_count.default_proc
    # pr.call({}, :foo) #=> 0

    text.split.map(&:downcase).each do |word|
      word_count[word] += 1
    end

    word_count
  end
end

class Config
  @@config = Hash.new do |hash, missing_key|
    hash[missing_key] = Hash.new(&hash.default_proc)
  end

  def self.[](key)
    @@config[key]
  end
end

# Config[:prod][:db][:adapter] = 'pg'

require 'open-uri'
require 'cgi'
require 'json'

class Temperature
  class << self
    attr_accessor :api_key

    def in(city)
      temperature[city]
    end

    def temperature
      Hash.new do |h, city|
        url = "http://api.apixu.com/v1/current.json?key=#{api_key}&q=#{CGI.escape(city)}"
        h[city] = JSON.parse(open(url).read)['current']['temp_c']
      end
    end
  end
end
