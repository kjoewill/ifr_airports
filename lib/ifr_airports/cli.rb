class IfrAirports::CLI 

  def call 
    puts "IFR Airports"
    menu
    goodbye
  end
  
  def list_ifr_airports(state)
    puts "#{state} Airports that support for poor weather landing with electronic guidance "
    puts <<~HEREDOC
      1. Colorado Springs Airport (KCOS)
      2. Meadow Lake Airport (KFLY)
    HEREDOC
  end
  
  
  def list_airport_weather(id)
    puts "Current weather for #{id}:"
    puts "Temp: 72F"
    puts "Overcast: 3000"
  end
  
  def menu
    s_input = nil 
    while s_input != "exit" 
      puts "Please provide a State name to search (or 'exit')"
      s_input = gets.strip.downcase
      if s_input != "exit" &&  state_valid?(s_input)
        
        list_ifr_airports(s_input)
        
        id_input = nil
        while !id_valid?(id_input)
          puts "Please select a state airport identifier for detailed current weather"
          id_input = gets.strip.downcase
        end
        list_airport_weather(id_input)
      end
    end
  end
  
  def goodbye
    puts "Adios!"
  end
  
  def id_valid?(id)
    id == "kcos" || id == "kfly"
  end
    
  def state_valid?(state)
    state == "colorado"
  end
  
end