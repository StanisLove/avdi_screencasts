require 'net/http'

class Response
  # /\A\d+\z/ === '5432'
  # (0..10) === 5
  # Numberic === 123
  SUCCESS = ->(response) { (200..299) === response.code.to_i }
  ERROR = ->(response) { (400..499) === response.code.to_i }

  attr_reader :response

  def initialize(response)
    @response = response
  end

  def success?
    SUCCESS === response
  end

  def error?
    ERROR === response
  end

  def status
    case response
    when SUCCESS then 'success'
    when ERROR then 'error'
    end
  end
end

class Request
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def self.get_response(url)
    new(url).get_response
  end

  def get_response
    Response.new Net::HTTP.get_response(URI.parse url)
  end
end

