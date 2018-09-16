# Following Avi's demo and this file is being used as an "environment file"
require_relative "./ifr_airports/version"
require_relative './ifr_airports/cli'
require_relative './ifr_airports/airport'
require_relative './ifr_airports/airport_scraper'
require_relative './ifr_airports/weather_api'
require_relative './ifr_airports/utilities'

#Avi's demo (https://www.youtube.com/watch?v=_lDExWIhYKI) at minute ~50 is debating whether
# this is best to require these dependencies here.  He will revisit later
require 'open-uri'
require 'nokogiri'
require 'pry'
