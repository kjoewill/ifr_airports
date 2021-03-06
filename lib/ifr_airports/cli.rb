class IfrAirports::CLI 

  def call 
    puts "Welcome to IFR Airports!"
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
    if airport.augment_with_weather
      delta_minutes = ((Time.now - airport.timestamp) / 60).floor
      puts "Current weather for #{id}: ( #{delta_minutes} minutes ago )"
      puts "Temp: #{airport.temp}C"
      puts "Visiblity: #{airport.visibility} miles"
      puts "Wind Direction:  #{airport.wind_direction} degrees"
      puts "Wind Speed:  #{airport.wind_speed} kts"
      puts
    else
      puts "Sorry, No weather observation available for #{id}"
      puts
    end
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
        while id_input != "exit"
          puts "Choose an airport ID, from the above list, for current weather (or 'exit')"
          print ">"
          id_input = gets.strip
          if id_input != "exit" && id_valid?(id_input)
            list_airport_weather(id_input)
          end
        end
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