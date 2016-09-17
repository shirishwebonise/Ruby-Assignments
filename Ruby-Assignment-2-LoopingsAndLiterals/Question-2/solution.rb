
input_file_name = "./input.txt"

input_file = File.open(input_file_name)

# method for checking common substring
def haveCommonSubstring(string_A, string_B)
  intersection = string_A.chomp.split('') & string_B.chomp.split('')
  intersection.length > 0
end

totalTests = input_file.readline.chomp.to_i

# the main flow of program
totalTests.times do
  # read string A
  string_A = input_file.readline

  # second string
  string_B = input_file.readline

  # check for common substring
  if( haveCommonSubstring(string_A, string_B) )
    puts "YES"
  else
    puts "NO"
  end
end
