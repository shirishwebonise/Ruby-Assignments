require "byebug"
input_file_name = "./input.txt"

input_file = File.open(input_file_name)

line_count = 0

def hasCommonSubstring(string_A, string_B)
	string_A.chomp.split('').each do |character|
		return true if string_B.include? character
	end
	false
end

while !input_file.eof do
	line_count += 1

	line =  input_file.readline

	# skip first line
	next if line_count == 1

	# first line of test case
	string_A = line

	line =  input_file.readline

	# second line of test case
	string_B = line

	# check for common substring
	if( hasCommonSubstring(string_A, string_B) )
		puts "YES"
	else
		puts "NO"
	end
end
