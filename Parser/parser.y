/*
ACD assignment - 2:
Write a parser to identify the following grammar:


stmts   : stmts stmt 
        | epsilon
stmt    : ;
        | expr ;
	    | if (expr) stmt
	    | if (expr) stmt else stmt
	    | for (expr ; expr ; expr ) stmt
	    |  { stmts }


Team Members:
Prajna N Hebbar - 181IT132
Adharsh Kamath - 181IT202
Sriram Rao - 181IT246
*/

// %{
//     #include<stdio.h>
//     int yylex(void);
//     int yyerror(const char *s);
//     int success = 1;
// %}

// %token integer_constant character_constant float_constant identifier
// %token IF ELSE FOR 
// %define parse.error verbose
// %start stmts
// %left '<' '>' '=' 
// %left '+' '-'
// %left '*' '/'
// %nonassoc "then"
// %nonassoc ELSE

// %%

// stmts       :stmts stmt
//             | %empty 
//             ;
// stmt        : ';'
//             | expr ';'
//             | IF '(' expr ')' stmt          %prec "then"
//             | IF '(' expr ')' stmt ELSE stmt
//             | FOR '(' expr ';' expr ';' expr ')' stmt
//             | '{' stmts '}' 
//             ;
// expr        : expr '+' expr
//             | expr '-' expr
//             | expr '*' expr
//             | expr '/' expr
//             | expr '>' expr
//             | expr '<' expr
//             | expr '=' expr
//             | identifier           
//             | integer_constant
//             | character_constant
//             | float_constant
//             ;
// %%

// int main() {
//     #ifdef YYDEBUG
//         yydebug = 1;
//     #endif
//     yyparse();
//     if(success) {
//         printf("OK\n");
//     }
//     return 0;
// }

// int yyerror(const char *s) {
//     extern int yylineno;
//     printf("\nProblem occured at line number %d\nError: %s\n", yylineno, s);
//     success = 0;
//     return 0;
// }

%{ 
/* Definition section */
#include <stdio.h> 
#include <string.h>    
#include <stdlib.h> 

extern int yylex(); 

void yyerror(char *msg);        
%} 
  
%union { 
   char* f; 
} 
  
/* %token <f> EXPR */
%token IF FOR ID U_OP OP NUM
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%%
   STMTS :   STMTS STMT
         |   %empty
         ;

   STMT  :   ';'
         |   EXPR ';'
         |   IF '('EXPR')' STMT  %prec LOWER_THAN_ELSE
         |   IF '('EXPR')' STMT ELSE STMT
         |   FOR '('EXPR';'EXPR';'EXPR')' STMT
         |   '{'STMTS'}'
         ;
   
   EXPR  :  TERM
         |  ID U_OP
         |  EXPR OP EXPR
         ;
   
   TERM  :  ID
         |  NUM
         ;
%% 
  
void yyerror(char *msg) 
{ 
   fprintf(stderr, "%s\n", msg); 
   exit(1); 
} 
  
//driver code  
int main() 
{ 
   yyparse();
   printf("OK"); 
   return 0; 
} 

