# encoding: utf-8

IDENTIFIER = "com.github.digitalpardoe.remark"
TEXT_FILTERS = [
  {:name => 'html', :human_readable => 'HTML', :method => lambda { |text| text }},
  {:name => 'markdown', :human_readable => 'Markdown', :method => lambda { |text| BlueCloth.new(text).to_html }},
  {:name => 'textile', :human_readable => 'Textile', :method => lambda { |text| RedCloth.new(text).to_html }}
]
DEFAULT_TEXT_FILTER = TEXT_FILTERS[1][:name]
TIMEZONES = [
  {:name => 'UTC-12:00', :human_readable => 'Baker Island'},
  {:name => 'UTC-11:00', :human_readable => 'Pago Pago, Alofi'},
  {:name => 'UTC-10:00', :human_readable => 'Papeete, Avarua, Adak, Honolulu'},
  {:name => 'UTC-09:30', :human_readable => 'Taiohae'},
  {:name => 'UTC-09:00', :human_readable => 'Anchorage, Juneau, Mangareva'},
  {:name => 'UTC-08:00', :human_readable => 'Seattle, Portland, San Francisco, Los Angeles, Las Vegas, Vancouver, Whitehorse, Tijuana'},
  {:name => 'UTC-07:00', :human_readable => 'Denver, Phoenix, Salt Lake City, Calgary, Yellowknife, Hermosillo, Ciudad Juárez, Mazatlán'},
  {:name => 'UTC-06:00', :human_readable => 'Belize City, Chicago, Dallas, Guadalajara, Guatemala City, Houston, Managua, Mexico City, Minneapolis, Monterrey, New Orleans, Regina, St. Louis, San José, San Salvador, Tegucigalpa'},
  {:name => 'UTC-05:00', :human_readable => 'Boston, New York, Philadelphia, Washington, D.C., Atlanta, Miami, Cleveland, Cincinnati, Detroit, Lima, Ottawa, Montréal, Québec, Quito, Toronto, Bogotá, Havana, Port-au-Prince, Kingston, Iqaluit'},
  {:name => 'UTC-04:30', :human_readable => 'Caracas'},
  {:name => 'UTC-04:00', :human_readable => 'Santiago de Chile, La Paz, San Juan de Puerto Rico, Rio Branco, Halifax'},
  {:name => 'UTC-03:30', :human_readable => 'Saint John\'s'},
  {:name => 'UTC-03:00', :human_readable => 'Rio de Janeiro, Sao Paulo, Recife, Nuuk, Buenos Aires, Montevideo, Cayenne'},
  {:name => 'UTC-02:00', :human_readable => 'Vila dos Remedios, King Edward Point'},
  {:name => 'UTC-01:00', :human_readable => 'Praia, Ponta Delgada'},
  {:name => 'UTC±00:00', :human_readable => 'London, Dublin, Abidjan, Casablanca, Accra, Lisbon'},
  {:name => 'UTC+01:00', :human_readable => 'Amsterdam, Belgrade, Berlin, Budapest, Vienna, Prague, Brussels, Kinshasa, Lagos, Madrid, Paris, Zagreb, Rome, Stockholm, Oslo, Warsaw, Skopje'},
  {:name => 'UTC+02:00', :human_readable => 'Athens, Sofia, Cairo, Riga, Istanbul, Helsinki, Jerusalem, Johannesburg, Bucharest, Vilnius'},
  {:name => 'UTC+03:00', :human_readable => 'Nairobi, Baghdad, Khartoum, Mogadishu'},
  {:name => 'UTC+03:30', :human_readable => 'Tehran'},
  {:name => 'UTC+04:00', :human_readable => 'Baku, Tbilisi, Yerevan, Dubai, Moscow'},
  {:name => 'UTC+04:30', :human_readable => 'Kabul, Herat, Kandahar, Mazar-i Sharif'},
  {:name => 'UTC+05:00', :human_readable => 'Karachi, Lahore, Faisalabad, Rawalpindi'},
  {:name => 'UTC+05:30', :human_readable => 'Ahmedabad, Bengaluru, Chennai, Colombo, Delhi, Hyderabad, Kolkata, Mumbai, Thiruvananthapuram'},
  {:name => 'UTC+05:45', :human_readable => 'Kathmandu, Biratnagar, Patan, Pokhara'},
  {:name => 'UTC+06:00', :human_readable => 'Astana, Almaty, Bishkek, Dhaka, Chittagong, Khulna, Sylhet, Thimphu'},
  {:name => 'UTC+06:30', :human_readable => 'Bantam, Rangoon, Naypyitaw'},
  {:name => 'UTC+07:00', :human_readable => 'Yakarta, Bangkok, Phnom Pehn, Hanoi'},
  {:name => 'UTC+08:00', :human_readable => 'Western Australia, Brunei, People\'s Republic Of China'},
  {:name => 'UTC+08:45', :human_readable => 'Eucla'},
  {:name => 'UTC+09:00', :human_readable => 'Seoul, Tokyo'},
  {:name => 'UTC+09:30', :human_readable => 'Adelaide, Darwin'},
  {:name => 'UTC+10:00', :human_readable => 'Sydney, Melbourne, Yakutsk, Port Moresby, Hagatna'},
  {:name => 'UTC+10:30', :human_readable => 'Lord Howe'},
  {:name => 'UTC+11:00', :human_readable => 'Vladivostok, Noumea, Port Vila'},
  {:name => 'UTC+11:30', :human_readable => 'Burnt Pine'},
  {:name => 'UTC+12:00', :human_readable => 'Auckland, Wellington, Suva, Anadyr'},
  {:name => 'UTC+12:45', :human_readable => 'Waitangi'},
  {:name => 'UTC+13:00', :human_readable => 'Apia, Nukualofa'},
  {:name => 'UTC+14:00', :human_readable => 'Kiritimati, Fakaofo'}
]