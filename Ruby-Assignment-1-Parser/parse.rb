require 'ripper'
require 'pp'
require 'io/console'

input_snippet_file = "./code-snippet.rb"

code_snippet = File.read(input_snippet_file)

puts "\nTokens.."
pp Ripper.lex(code_snippet)

puts "\nSymbolic expression tree.."
pp Ripper.sexp(code_snippet)