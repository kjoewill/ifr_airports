class IfrAirports::CLI 

  def call 
    puts "IFR Airports"
    menu
    goodbye
  end
  
  def list_ifr_airports(state)
    puts "#{state} Airports that support for poor weather landing with electronic guidance "
    
    @airports = IfrAirports::Airport.all_in_state(state)
    @airports.each { |e| puts "#{e.name} - #{e.id}" }
    
  end
  
  
  def list_airport_weather(id)
    
    airport = IfrAirports::Airport.find_by_id(id)
    airport.augment_with_weather
    
    #maybe move this into a build dosplay string on Airport
    puts "Current weather for #{id}:"
    puts "Temp: #{airport.temp}"
    puts "Visiblity: #{airport.visibility}"
    puts "Wind Direction:  #{airport.wind_direction}"
    puts "Wind Speed:  #{airport.wind_speed}"

  end
  
  def menu
    s_input = nil 
    while s_input != "exit" 
      puts "Please provide a State name to search (or 'exit')"
      s_input = gets.strip
      if s_input != "exit" &&  state_valid?(s_input)
        
        list_ifr_airports(s_input)
        
        id_input = nil
        while !id_valid?(id_input)
          puts "Please select a state airport identifier for detailed current weather"
          id_input = gets.strip
        end
        list_airport_weather(id_input)
      end
    end
  end
  
  def goodbye
    puts "Adios!"
  end
  
  def id_valid?(id)
    IfrAirports::Airport.id_exits(id)
  end
    
  def state_valid?(state)
    IfrAirports::Airport.state_valid?(state)
  end
  
end