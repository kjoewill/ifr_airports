class IfrAirports::CLI 

  def call 
    puts "IFR Airports"
    menu
  end
  
  def list_ifr_airports(state)
    puts <<~HEREDOC
      1. Colorado Springs Airport (KCOS)
      2. Meadow Lake Airport (KFLY)
    HEREDOC
  end
  
  def menu
    puts "Please provide a State name to search"
    state = gets.strip
    list_ifr_airports(state)
  end
  
end