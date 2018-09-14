class IfrAirports::AirportScraper
  
  def self.scrape_globalair(state)
    airports = []
    state_url = self.state_url(state)
    doc = Nokogiri::HTML(open(state_url))
    
    table = doc.css('[id = "content_dgAirportSearch"]')
    rows = table.css("tr")
    rows.shift # remove the table header
    
    rows.each do |row|
      if supports_instrument_landings?(row)
        airports << IfrAirports::Airport.new(row.css("td")[1].text, row.css("td")[0].text)
      end
    end
    airports
  end
  
  #private
  
  def self.state_url(state)
    "https://www.globalair.com/airport/Airports_in_#{state}.aspx"
  end
  
  def self.supports_instrument_landings?(row)
    row.css("td")[2].text != "None"
  end
  
end