class IfrAirports::CLI 

  def call 
    puts "IFR Airports"
    menu
    goodbye
  end
  
  private
  
  def list_ifr_airports(state)
    puts "========================================================"
    puts
    puts "#{state.capitalize} Airports that support poor weather operations with electronic guidance "
    puts
    @airports = IfrAirports::Airport.all_in_state(state)
    @airports.each { |e| puts "#{e.name} - #{e.id}" }
    puts "========================================================="
  end
  
  def list_airport_weather(id)
    
    airport = IfrAirports::Airport.find_by_id(id)
    airport.augment_with_weather
    
    delta = ((DateTime.now - airport.timestamp)*24*60).to_int
    
    puts "Current weather for #{id}:"
    puts "Measurement taken #{delta} minutes ago"
    puts "Temp: #{airport.temp}C"
    puts "Visiblity: #{airport.visibility} miles"
    puts "Wind Direction:  #{airport.wind_direction} degrees"
    puts "Wind Speed:  #{airport.wind_speed} kts"
    puts
  end
  
  def menu
    s_input = nil 
    while s_input != "exit" 
      puts "Please provide a State name to search (or 'exit')"
      print ">"
      s_input = gets.strip
      s_input = convert_abreviation(s_input) if s_input.size == 2
      if s_input != "exit" &&  state_valid?(s_input)
        list_ifr_airports(s_input)
        id_input = nil
        while !id_valid?(id_input)
          puts "Please select an airport identifier (from the above list) for detailed current weather"
          print ">"
          id_input = gets.strip.upcase
        end
        list_airport_weather(id_input)
      end
    end
  end
  
  def goodbye
    puts "Goodbye!"
  end
  
  def id_valid?(id)
    IfrAirports::Airport.id_exits(id)
  end
    
  def state_valid?(state)
    IfrAirports::Utilities.state_name_valid?(state)
  end
  
  def convert_abreviation(abbrv) # the irony!
    IfrAirports::Utilities.name_for_abreviation(abbrv)
  end
  
end