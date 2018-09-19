class IfrAirports::Airport
  
  attr_accessor :name, :id, :temp, :flight_rules, :visibility, :wind_direction, :wind_speed, :timestamp, :state
  
  @@all = []
  
  def initialize(name, id, state)
    @name = name
    @id = id
    @state = state
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.all_in_state(state)
    if !self.all.find { |s| s.state == state }
      IfrAirports::AirportScraper.scrape_globalair(state)
    end
    self.all.select { |a| a.state == state }
  end
  
  def augment_with_weather
    IfrAirports::WeatherAPI.weather_for(self)
  end
  
  def self.find_by_id(id)
    @@all.find { |airport| airport.id == id.upcase }
  end
  
  def self.id_exits(id)
    @@all.any?{ |e| e.id == id.upcase }
  end

end