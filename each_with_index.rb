top_10 = ["Walmart", "Exxon Mobil", "Apple", "Berkshire Hathaway", "Amazon.com", "UnitedHealth Group", "McKesson", "CVS Health", "AT&T", "AmerisourceBergen"]

  top_10.each_with_index do | company, index |
    puts "#{index}. #{company}"
  end