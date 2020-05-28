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

%{ 

/* Definition section */

    #include <stdio.h> 
    #include <string.h>    
    #include <stdlib.h> 
    extern int yylex(void);
    int yyerror(const char *msg);
    int success = 1; 
      
%} 
  
%union { 
   char* f; 
} 
  
/* %token <f> EXPR */

%token IF FOR ID UNARY_OP OP NUM
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
         |  ID UNARY_OP
         |  UNARY_OP ID
         |  TERM OP EXPR
         |  ID '=' EXPR
         ;
   
   TERM  :  ID
         |  NUM
         ;
%% 
  
int main() {
    extern int yylineno;
    yylineno = 0;
    yyparse();
    if(success) {
        printf("OK\n");
    }
    return 0;
}

int yyerror(const char *msg) {
    extern int yylineno;
    printf("\nProblem occured at line number %d\nError: %s\n", yylineno, msg);
    success = 0;
    return 1;
}
