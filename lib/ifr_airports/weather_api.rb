require 'net/http'
require 'json'

class IfrAirports::WeatherAPI
  
  def self.weather_for(airport)
    url = station_url(airport.id)
    uri = URI(url)
    response = JSON.parse(Net::HTTP.get(uri))
    
    airport.flight_rules = response["Flight-Rules"]
    airport.temp = response["Temperature"]
    airport.visibility = response["Visibility"]
    airport.wind_direction = response["Wind-Direction"]
    airport.wind_speed = response["Wind-Speed"]
    airport.timestamp = IfrAirports::Utilities.parse_metar_time(response["Time"])
  end
  
  private
  
  def self.station_url(id)
    "https://avwx.rest/api/metar/K#{id}"
  end

end