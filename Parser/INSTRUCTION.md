# Instructions to run the program:

- Run the following in a shell:
  - lex lexer.l
  - yacc -d parser.y
  - gcc lex.yy.c y.tab.c -o prog
- This will create an executable prog that can be then run
