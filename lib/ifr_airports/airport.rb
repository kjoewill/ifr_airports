class IfrAirports::Airport
  
  attr_accessor :name, :id, :temp, :flight_rules, :visibility, :wind_direction, :wind_speed
  
  def initialize(name, id)
    @name = name
    @id = id
  end

  def self.all_in_state(state)
    #tap?
    @@all = IfrAirports::AirportScraper.scrape_globalair(state)
    @@all
  end
  
  def augment_with_weather
    IfrAirports::WeatherAPI.weather_for(self)
  end
  
  def self.find_by_id(id)
    @@all.find { |airport| airport.id == id }
  end
  
  def self.id_exits(id)
    @@all.any?{ |e| e.id == id }
  end
  
  def self.state_valid?(state)
    ["alabama","alaska","arizona","arkansas","california","colorado","connecticut","delaware","florida","georgia","hawaii",     
    "idaho","illinois","indiana","iowa","kansas","kentucky","louisiana","maine","maryland","massachusetts","michigan",
    "minnesota","mississippi","missouri","montana","nebraska","nevada","new hampshire","new jersey","new mexico","new york",
    "north carolina","north dakota","ohio","oklahoma","oregon","pennsylvania","rhode island","south carolina",
    "south dakota","tennessee","texas","utah","vermont","virginia","washington","west virginia","wisconsin","wyoming"].include?(state.downcase)
  end

end