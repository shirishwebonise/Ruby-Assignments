
INPUT_FILE_NAME = "./input.txt"

# method for calculating sum of array elements
def sum_of_numbers(int_array)
  total = int_array.reduce(:+)
  total ? total : 0
end

# method to check the array for the required condition
def array_has_such_element(int_array)
  int_array.each_with_index do |item, index|
    left_subarray = int_array[0, index]
    right_subarray = int_array[index+1, int_array.length]

    if sum_of_numbers(left_subarray) == sum_of_numbers(right_subarray)
      return true	
    end
  end
  false
end

# read file
input_file = File.open(INPUT_FILE_NAME)

# read number of test cases
TOTAL_CASES = input_file.readline.chomp.to_i

# the main flow of program
TOTAL_CASES.times do
  # read a line - number of elements in the array
  total_elements =  input_file.readline.chomp.to_i

  # second line - the array elements
  # read the line, split, convert string elements into integers
  int_array = input_file.readline.chomp.split.map{ |num| num.to_i }

  # check the array for given conditions
  if( array_has_such_element(int_array) )
    puts "YES"
  else
    puts "NO"
  end
end
