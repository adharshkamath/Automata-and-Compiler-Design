# Instructions to run the program:

## Run the commands yourself

- Run the following in a shell:
  - `lex lexer.l`
  - `yacc -d parser.y`
  - `gcc lex.yy.c y.tab.c -o program`
- This will create an executable "program" that can then be run

## Using the makefile

- Type `make` in the shell.
- This will create the same executable "program" as the above steps
