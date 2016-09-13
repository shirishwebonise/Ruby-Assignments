# How ruby parses and compiles the code

## tokenize the code ##
Extract tokens from the code. Tokens can be considered as words meaningful to a programming language. eg. constants, identifiers, operators, reserved words, and separators

## parse the tokens into statements meaningful to ruby ##
In this step, tokens are grouped together into sentenses that makes sense to ruby. In this process, order of instructions, and blocks are taken into consideration. For this, ruby uses a parser generator called Bison which uses the LALR parser. Bison requires to have grammer rules of the language in a 'parse.y' file in the form of BNF(Backus Naur Form) notation. Bison processes the grammer rules(parse.y file) to generate a parser code well in advance (this generally happens during installation time). This parser code parses the tokens to generate a parse tree.

## compile tokens into low level YARV instructions ##
The parse tree is compiled into YARV instructions. YARV instructions are directly executable by the YARV (Yet Another Ruby Virtual Machine).