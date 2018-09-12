class IfrAirports::AirportScraper
  
  def self.all 
    
    airports = []
    airports
    
    airport_1 = IfrAirports::Airport.new 
    airport_1.name = "Colorado Springs Airport"
    airport_1.id = "KCOS"
    airport_1.temp = "72F"
    airport_1.clouds = "Overcast - 3000 feet"
    airport_1.supports_ifr = true
    
    airport_2 = IfrAirports::Airport.new 
    airport_2.name = "Meadow Lake Airport"
    airport_2.id = "KFLY"
    airport_2.temp = "78F"
    airport_2.clouds = "Broken - 12000 feet"
    airport_1.supports_ifr = true
    
    [airport_1, airport_2]
    
  end
  
  def self.scrape_airnav(state)
    state_url = self.state_url(state)
    doc = Nokogiri::HTML(open(state_url))
    binding.pry
  end
  
  def self.state_url(state)
    #example - https://www.globalair.com/airport/Airports_in_Colorado.aspx
    base_url = "https://www.globalair.com/airport/"
    state_url = "#{base_url}Airports_in_#{state}.aspx"
    binding.pry
    state_url
  end
end