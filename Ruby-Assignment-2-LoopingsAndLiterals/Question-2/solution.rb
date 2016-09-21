
INPUT_FILE_NAME = "./input.txt"

input_file = File.open(INPUT_FILE_NAME)

# method for checking common substring
def have_common_substring(string_A, string_B)
  intersection = string_A.chomp.split('') & string_B.chomp.split('')
  intersection.length > 0
end

TOTAL_CASES = input_file.readline.chomp.to_i

# the main flow of program
TOTAL_CASES.times do
  # read string A
  string_A = input_file.readline

  # second string
  string_B = input_file.readline

  # check for common substring
  if( have_common_substring(string_A, string_B) )
    puts "YES"
  else
    puts "NO"
  end
end
