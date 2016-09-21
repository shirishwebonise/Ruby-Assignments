
TOTAL_CASES = gets.chomp.to_i

TOTAL_CASES.times do
  array_string_A = gets.chomp.split('')

  array_string_B = gets.chomp.split('')

  if( (array_string_A & array_string_B).length > 0 )
    puts "YES"
  else
    puts "NO"
  end
end
