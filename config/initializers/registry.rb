# encoding: UTF-8

IDENTIFIER = "com.github.digitalpardoe.remark"
TEXT_FILTERS = [
  {:name => 'html', :human_readable => 'HTML', :method => lambda { |text| text }},
  {:name => 'markdown', :human_readable => 'Markdown', :method => lambda { |text| BlueCloth.new(text).to_html }},
  {:name => 'textile', :human_readable => 'Textile', :method => lambda { |text| RedCloth.new(text).to_html }}
]
DEFAULT_TEXT_FILTER = TEXT_FILTERS[1][:name]
TIME_ZONES = [
  {:name => 'UTC-12:00', :human_readable => '-12:00 - Baker Island'},
  {:name => 'UTC-11:00', :human_readable => '-11:00 - Pago Pago, Alofi'},
  {:name => 'UTC-10:00', :human_readable => '-10:00 - Papeete, Avarua, Adak, Honolulu'},
  {:name => 'UTC-09:30', :human_readable => '-09:30 - Taiohae'},
  {:name => 'UTC-09:00', :human_readable => '-09:00 - Anchorage, Juneau, Mangareva'},
  {:name => 'UTC-08:00', :human_readable => '-08:00 - Seattle, Portland, San Francisco, Los Angeles, Las Vegas, Vancouver, Whitehorse, Tijuana'},
  {:name => 'UTC-07:00', :human_readable => '-07:00 - Denver, Phoenix, Salt Lake City, Calgary, Yellowknife, Hermosillo, Ciudad Juárez, Mazatlán'},
  {:name => 'UTC-06:00', :human_readable => '-06:00 - Belize City, Chicago, Dallas, Guadalajara, Guatemala City, Houston, Managua, Mexico City, Minneapolis, Monterrey, New Orleans, Regina, St. Louis, San José, San Salvador, Tegucigalpa'},
  {:name => 'UTC-05:00', :human_readable => '-05:00 - Boston, New York, Philadelphia, Washington, D.C., Atlanta, Miami, Cleveland, Cincinnati, Detroit, Lima, Ottawa, Montréal, Québec, Quito, Toronto, Bogotá, Havana, Port-au-Prince, Kingston, Iqaluit'},
  {:name => 'UTC-04:30', :human_readable => '-04:30 - Caracas'},
  {:name => 'UTC-04:00', :human_readable => '-04:00 - Santiago de Chile, La Paz, San Juan de Puerto Rico, Rio Branco, Halifax'},
  {:name => 'UTC-03:30', :human_readable => '-03:30 - Saint John\'s'},
  {:name => 'UTC-03:00', :human_readable => '-03:00 - Rio de Janeiro, Sao Paulo, Recife, Nuuk, Buenos Aires, Montevideo, Cayenne'},
  {:name => 'UTC-02:00', :human_readable => '-02:00 - Vila dos Remedios, King Edward Point'},
  {:name => 'UTC-01:00', :human_readable => '-01:00 - Praia, Ponta Delgada'},
  {:name => 'UTC±00:00', :human_readable => '±00:00 - London, Dublin, Abidjan, Casablanca, Accra, Lisbon'},
  {:name => 'UTC+01:00', :human_readable => '+01:00 - Amsterdam, Belgrade, Berlin, Budapest, Vienna, Prague, Brussels, Kinshasa, Lagos, Madrid, Paris, Zagreb, Rome, Stockholm, Oslo, Warsaw, Skopje'},
  {:name => 'UTC+02:00', :human_readable => '+02:00 - Athens, Sofia, Cairo, Riga, Istanbul, Helsinki, Jerusalem, Johannesburg, Bucharest, Vilnius'},
  {:name => 'UTC+03:00', :human_readable => '+03:00 - Nairobi, Baghdad, Khartoum, Mogadishu'},
  {:name => 'UTC+03:30', :human_readable => '+03:30 - Tehran'},
  {:name => 'UTC+04:00', :human_readable => '+04:00 - Baku, Tbilisi, Yerevan, Dubai, Moscow'},
  {:name => 'UTC+04:30', :human_readable => '+04:30 - Kabul, Herat, Kandahar, Mazar-i Sharif'},
  {:name => 'UTC+05:00', :human_readable => '+05:00 - Karachi, Lahore, Faisalabad, Rawalpindi'},
  {:name => 'UTC+05:30', :human_readable => '+05:30 - Ahmedabad, Bengaluru, Chennai, Colombo, Delhi, Hyderabad, Kolkata, Mumbai, Thiruvananthapuram'},
  {:name => 'UTC+05:45', :human_readable => '+05:45 - Kathmandu, Biratnagar, Patan, Pokhara'},
  {:name => 'UTC+06:00', :human_readable => '+06:00 - Astana, Almaty, Bishkek, Dhaka, Chittagong, Khulna, Sylhet, Thimphu'},
  {:name => 'UTC+06:30', :human_readable => '+06:30 - Bantam, Rangoon, Naypyitaw'},
  {:name => 'UTC+07:00', :human_readable => '+07:00 - Yakarta, Bangkok, Phnom Pehn, Hanoi'},
  {:name => 'UTC+08:00', :human_readable => '+08:00 - Western Australia, Brunei, People\'s Republic Of China'},
  {:name => 'UTC+08:45', :human_readable => '+08:45 - Eucla'},
  {:name => 'UTC+09:00', :human_readable => '+09:00 - Seoul, Tokyo'},
  {:name => 'UTC+09:30', :human_readable => '+09:30 - Adelaide, Darwin'},
  {:name => 'UTC+10:00', :human_readable => '+10:00 - Sydney, Melbourne, Yakutsk, Port Moresby, Hagatna'},
  {:name => 'UTC+10:30', :human_readable => '+10:30 - Lord Howe'},
  {:name => 'UTC+11:00', :human_readable => '+11:00 - Vladivostok, Noumea, Port Vila'},
  {:name => 'UTC+11:30', :human_readable => '+11:30 - Burnt Pine'},
  {:name => 'UTC+12:00', :human_readable => '+12:00 - Auckland, Wellington, Suva, Anadyr'},
  {:name => 'UTC+12:45', :human_readable => '+12:45 - Waitangi'},
  {:name => 'UTC+13:00', :human_readable => '+13:00 - Apia, Nukualofa'},
  {:name => 'UTC+14:00', :human_readable => '+14:00 - Kiritimati, Fakaofo'}
]
DEFAULT_TIME_ZONE = TIME_ZONES[15][:name]
