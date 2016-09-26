require './time_of_day'
require './component_factory'

INPUT_FILE_NAME = "./input.txt"

# open file for reading
input_file = File.open(INPUT_FILE_NAME)

# read number of test cases
TOTAL_FLIGHTS = input_file.readline.chomp.to_i

# create Schedule class using metaprogramming
Schedule = ComponentFactory.create_schedule_class()

# create object of that newely created class
schedule = Schedule.new

# read flight timings from the file
TOTAL_FLIGHTS.times do
  # arriaval time
  line1 = input_file.readline.chomp

  #departure time
  line2 = input_file.readline.chomp
  schedule.add_flight(TimeOfDay.new(line1), TimeOfDay.new(line2))
end

max_platforms = schedule.no_of_platforms

puts max_platforms
