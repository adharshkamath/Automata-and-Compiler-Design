# Questions:
 1. Write an lexical analyzer using lex/flex to identify tokens of a typical C program. The program should be able to print series of token-ids for every lexical pattern that it recognizes. Please show the lex specification and the working of the lexical analyzer. 
 2. Write a parser to identify the following grammar:<br>
   ``` stmts -> stmts stmt
        | epsilon
    stmt -> ;
        | expr ;
        | if (expr) stmt
        | if (expr) stmt else stmt
        | for (expr ; expr ; expr ) stmt
        | { stmts }```
You should show the parser specification and the working of the parser to show if there is any error encountered in the given input program. If there is no error, it should report “OK”.
