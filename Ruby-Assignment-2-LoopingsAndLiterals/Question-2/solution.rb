
input_file_name = "./input.txt"

input_file = File.open(input_file_name)

line_count = 0

T = input_file.readline.chomp.to_i

# method for checking common substring
def hasCommonSubstring(string_A, string_B)
	string_A.chomp.split('').each do |character|
		return true if string_B.include? character
	end
	false
end

# the main flow of program
iterator = 0
while iterator < T && !input_file.eof? do
	iterator += 1

	line =  input_file.readline
	# first string
	string_A = line

	line =  input_file.readline
	# second string
	string_B = line

	# check for common substring
	if( hasCommonSubstring(string_A, string_B) )
		puts "YES"
	else
		puts "NO"
	end
end
