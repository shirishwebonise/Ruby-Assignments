
puts "use 'exit' to stop"

f = File.open("code_snippet.rb").read

palindrome_matcher = /
  \A
    (?<pal>
      .?
      |(?<char>.)
        \g<pal>
        \k<char+0>
    )
  \z
/x

while true
  print "Enter a word: "
  word = gets.chomp
  exit if word =~ /exit/
  puts palindrome_matcher.match(word) ? true : false
end
