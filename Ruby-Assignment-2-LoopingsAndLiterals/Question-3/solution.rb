
input_text = gets.chomp

puts input_text

while input_text.length>1 do
  input_text.slice! input_text.length-2
  puts input_text
end
