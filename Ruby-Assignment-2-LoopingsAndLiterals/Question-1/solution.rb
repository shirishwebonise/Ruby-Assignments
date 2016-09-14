
input_file_name = "./input.txt"

input_file = File.open(input_file_name)

line_count = 0

N = 0

def sumOfNumbers(int_array)
	if int_array
		total = int_array.reduce(:+)
	end
	total ? total : 0
end

def containsSuchElement(int_array)
	int_array.each_with_index do |item, index|
		leftArray = int_array[0, index]
		rightArray = int_array[index+1, int_array.length]

		if sumOfNumbers(leftArray) == sumOfNumbers(rightArray)
			return true
		end
	end
	false
end

while !input_file.eof do
	line_count += 1

	# read a line
	line =  input_file.readline

	# skip first line
	next if line_count == 1

	# second line of test case
	# read the line, split, convert string elements into integers
	int_array = input_file.readline.split.map{ |num| num.to_i }

	# check the array for given conditions
	if( containsSuchElement(int_array) )
		puts "YES"
	else
		puts "NO"
	end
end
