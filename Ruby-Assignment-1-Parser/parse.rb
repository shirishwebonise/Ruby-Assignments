require 'ripper'
require 'pp'
require 'io/console'

input_snippet_file = "./code-snippet.rb"

code_snippet = File.read(input_snippet_file)

puts "\n===========Source Code==========="
puts code_snippet

puts "\n===========Tokens==========="
pp Ripper.lex(code_snippet)

puts "\n===========Symbolic expression tree==========="
pp Ripper.sexp(code_snippet)

puts "\n===========YARV instruction set (compiled code)==========="
pp RubyVM::InstructionSequence.compile(code_snippet).to_a
