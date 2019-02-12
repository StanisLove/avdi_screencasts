require 'open-uri'
require 'cgi'
require 'json'

class GetTemp
  DEFAULT_FALLBACK = ->(error) { raise }

  attr_reader :url

  def initialize(city)
    api_key = ENV['APIXU_KEY']
    @url    = "http://api.apixu.com/v1/current.json?key=#{api_key}&q=#{CGI.escape(city)}"
  end

  def self.call(city, &fallback)
    new(city).call(&fallback)
  end

  def call(&fallback)
    fallback ||= DEFAULT_FALLBACK
    data = open(url)
    JSON.parse(data)['current']['temp_c']
  rescue => error
    fallback.call(error)
  end
end

# GetTemp.call('Moscow') { 'N/A' }
# GetTemp.call('Moscow') do |error|
#   raise TempApi::Error, error.message
# end
