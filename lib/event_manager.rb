puts "Event Manager Initialized!"

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

lines = File.readlines "event_attendees.csv"
lines.each_with_index do |line,index|
  next if index == 0
  columns = line.split(",")
  name = columns[2]
  puts name
end
