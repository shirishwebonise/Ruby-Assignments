
input_file_name = "./input.txt"

# method for calculating sum of array elements
def sumOfNumbers(int_array)
	if int_array
		total = int_array.reduce(:+)
	end
	total ? total : 0
end

# method to check the array for the required condition
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

# read file
input_file = File.open(input_file_name)

# read number of test cases
total_cases = input_file.readline.chomp.to_i

# the main flow of program
total_cases.times do
	# read a line - number of elements in the array
	totalElements =  input_file.readline.chomp.to_i

	# second line - the array elements
	# read the line, split, convert string elements into integers
	line = input_file.readline.chomp
	int_array = line.split.map{ |num| num.to_i }

	# check the array for given conditions
	if( containsSuchElement(int_array) )
		puts "YES"
	else
		puts "NO"
	end
end
