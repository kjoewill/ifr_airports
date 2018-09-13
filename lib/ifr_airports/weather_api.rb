require 'net/http'
require 'json'

class IfrAirports::WeatherAPI
  
  def self.weather_for(airport = nil)
    url = 'https://avwx.rest/api/metar/KCOS'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    binding.pry
  end
  
end