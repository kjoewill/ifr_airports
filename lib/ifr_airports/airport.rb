class IfrAirports::Airport
  
  attr_accessor :name, :id, :temp, :flight_rules, :visibility, :wind_direction, :wind_speed, :timestamp
  
  def initialize(name, id)
    @name = name
    @id = id
  end

  def self.all_in_state(state)
    @@all = IfrAirports::AirportScraper.scrape_globalair(state)
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

end