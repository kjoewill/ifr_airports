require 'net/http'
require 'json'

class IfrAirports::WeatherAPI
  
  def self.weather_for(airport = nil)
    #url = 'https://avwx.rest/api/metar/KCOS'
    url = station_url(airport.id)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    
    flight_rules = response["Flight-Rules"]
    temp = response["Temperature"]
    visibility = response["Visibility"]
    wind_direction = response["Wind-Direction"]
    wind_speed = response["Wind-Speed"]
    
    if airport !=nil
      airport.flight_rules = flight_rules
      airport.temp = temp
      airport.visibility = visibility
      airport.wind_direction = wind_direction
      airport.wind_speed = wind_speed
    end

  end
  
  private
  
   def self.station_url(id)
    #example - 'https://avwx.rest/api/metar/KCOS'
    base_url = "https://avwx.rest/api/metar/"
    station_url = "#{base_url}K#{id}"
    station_url
  end

end