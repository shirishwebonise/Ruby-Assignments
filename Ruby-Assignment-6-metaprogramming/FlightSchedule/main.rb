require './time_of_day'
require './component_factory'

INPUT_FILE_NAME = "./input.txt"

# open file for reading
input_file = File.open(INPUT_FILE_NAME)

# read number of test cases
TOTAL_FLIGHTS = input_file.readline.chomp.to_i

Schedule = ComponentFactory.createScheduleClass()

schedule = Schedule.new

# read flight timings from the file
TOTAL_FLIGHTS.times do
  line1 = input_file.readline.chomp
  line2 = input_file.readline.chomp
  schedule.addFlight(TimeOfDay.new(line1), TimeOfDay.new(line2))
end

max_platforms = schedule.no_of_platforms

puts max_platforms