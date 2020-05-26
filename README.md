# Automata and Compiler Design

#### Code for the IT250 Assignments

1.  [x] Lexer to identify tokens in a C program
2.  [ ] Parser to identify a specified grammar

#### Team Members:

- Prajna N Hebbar - 181IT132
- Adharsh Kamath - 181IT202
- Sriram Rao - 181IT246

## Instructions:

- Run the following in a shell:
  - lex lexer.l
  - yacc -d parser.y
  - gcc lex.yy.c y.tab.c -o prog
- This will create an executable prog that can be then run
