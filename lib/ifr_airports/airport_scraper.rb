class IfrAirports::AirportScraper
  
  def self.scrape_globalair(state)
    airports = []
    state_url = self.state_url(state)
    doc = Nokogiri::HTML(open(state_url))
    
    table = doc.css('[id = "content_dgAirportSearch"]')
    rows = table.css("tr")
    rows.shift # remove the table header
    
    rows.reject { |r| !supports_instrument_landings?(r) }
    .collect {|r| IfrAirports::Airport.new(r.css("td")[1].text, r.css("td")[0].text) }
  end
  
  #private
  
  def self.state_url(state)
    "https://www.globalair.com/airport/Airports_in_#{modify_if_compound(state)}.aspx"
  end
  
  def self.supports_instrument_landings?(row)
    row.css("td")[2].text != "None"
  end
  
  def self.modify_if_compound(state) #"New York" => "New_York" 
    state.split.join("_")
  end
  
end