require "csv"
def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
  # if zipcode.nil?
  #   "00000"
  # elsif zipcode.length < 5
  #   zipcode.rjust(5,"0")
  # elsif zipcode.length > 5
  #   zipcode[0..4]
  # else
  #   zipcode
  # end
end

puts "Event Manager initialized."

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  first_name = row[:first_name]
  last_name = row[:last_name]
  zipcode = clean_zipcode(row[:zipcode])
  # if the zip code is exactly five digits, assume that it is ok
  # if the zip code is more than 5 digits, truncate it to the first 5 digits
  # if the zip code is less than 5 digits, add zeros to the front until it becomes five digits
  puts "#{first_name} #{last_name} #{zipcode}"
end


# The below code is manually defining a CSV parser: not ideal because Ruby provides a CSV parser
# Contents returns everything as one large string
# contents = File.read "event_attendees.csv"
# puts contents

# lines returns everything as an array
# lines = File.readlines "event_attendees.csv"
# row_index = 0
# lines.each do |line|
#   # next if line == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
#   row_index = row_index + 1
#   next if row_index == 1 #|| row_index == 2
#   columns = line.split(",")
#   name = columns[2]
#   p name
# end

# lines = File.readlines "event_attendees.csv"
# lines.each_with_index do |line,index|
#   next if index == 0
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end
