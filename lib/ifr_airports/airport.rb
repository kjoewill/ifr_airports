class IfrAirports::Airport
  
  attr_accessor :name, :id, :temp, :clouds, :supports_ifr
  
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
  
  def self.find_by_id(id)
    @@all.find { |airport| airport.id == id }
  end
  
  def self.id_exits(id)
    @@all.any?{ |e| e.id == id }
  end

end