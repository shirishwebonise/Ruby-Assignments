
TOTAL_CASES = gets.chomp.to_i

# method for calculating sum of array elements
def sum_of_numbers(numbers)
  total = numbers.reduce(:+)
  total ? total : 0
end

# method to check the array for the required condition
def check_array(numbers)
  right_sum = sum_of_numbers numbers
  left_sum = 0

  numbers.each do |num|
    if left_sum == right_sum - num
      puts "YES"
      return
    end
    left_sum += num
    right_sum -= num
  end
  puts "NO"
end

# main flow of logic
TOTAL_CASES.times do
  total_elements = gets.chomp.to_i
  numbers = gets.chomp.split.map{ |num| num.to_i }
  check_array(numbers)
end
