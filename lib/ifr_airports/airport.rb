class IfrAirports::Airport
  
  attr_accessor :name, :id, :temp, :flight_rules, :visibility, :wind_direction, :wind_speed
  
  def initialize(name, id)
    @name = name
    @id = id
  end

  def self.all_in_state(state)
    #tap?
    #need to filer returned Airports for non-ifr
    @@all = IfrAirports::AirportScraper.scrape_airnav(state)
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
    ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii",
    "Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan",
    "Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York",
    "North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina",
    "South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"].include?(state)
  end

end