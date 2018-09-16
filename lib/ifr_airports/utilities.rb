class IfrAirports::Utilities

  def self.state_name_valid?(name)
    STATE_ABBR_TO_NAME.value?(name.downcase)
  end
  
  def self.name_for_abreviation(abbrv)
    STATE_ABBR_TO_NAME[abbrv.upcase]
  end

  def self.parse_metar_time(time_string)
    if time_string != nil  
      Time.gm(Time.now.year, Time.now.month, time_string[0..1], time_string[2..3], time_string[4..5])
    else
      nil
    end
  end


  # Borrowed from https://gist.github.com/hmcfletch/1005552
  STATE_ABBR_TO_NAME = {
    'AL' => 'alabama',
    'AK' => 'alaska',
    'AZ' => 'arizona',
    'AR' => 'arkansas',
    'CA' => 'california',
    'CO' => 'colorado',
    'CT' => 'connecticut',
    'DE' => 'delaware',
    'FL' => 'florida',
    'GA' => 'georgia',
    'GU' => 'guam',
    'HI' => 'hawaii',
    'ID' => 'idaho',
    'IL' => 'illinois',
    'IN' => 'indiana',
    'IA' => 'iowa',
    'KS' => 'kansas',
    'KY' => 'kentucky',
    'LA' => 'louisiana',
    'ME' => 'maine',
    'MD' => 'maryland',
    'MA' => 'massachusetts',
    'MI' => 'michigan',
    'MN' => 'minnesota',
    'MS' => 'mississippi',
    'MO' => 'missouri',
    'MT' => 'montana',
    'NE' => 'nebraska',
    'NV' => 'nevada',
    'NH' => 'new hampshire',
    'NJ' => 'new jersey',
    'NM' => 'new mexico',
    'NY' => 'new york',
    'NC' => 'north carolina',
    'ND' => 'north dakota',
    'OH' => 'ohio',
    'OK' => 'oklahoma',
    'OR' => 'oregon',
    'PW' => 'palau',
    'PA' => 'pennsylvania',
    'RI' => 'rhode island',
    'SC' => 'south carolina',
    'SD' => 'south dakota',
    'TN' => 'tennessee',
    'TX' => 'texas',
    'UT' => 'utah',
    'VT' => 'vermont',
    'VI' => 'virgin Island',
    'VA' => 'virginia',
    'WA' => 'washington',
    'WV' => 'west virginia',
    'WI' => 'wisconsin',
    'WY' => 'wyoming'
  }
  
end
  