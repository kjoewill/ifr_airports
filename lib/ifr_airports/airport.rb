class IfrAirports::Airport
  
  attr_accessor :name, :id, :temp, :clouds, :supports_ifr

  def self.all_in_state(state)
    #tap?
    #need to filer returned Airports for non-ifr
    @@all = IfrAirports::AirportScraper.all
    @@all
  end
  
  def self.find_by_id(id)
    @@all.find { |airport| airport.id == id }
  end

end