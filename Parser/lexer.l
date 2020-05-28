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
	#include <stdio.h> 
	#include <stdlib.h> 
	#include "y.tab.h" 
	extern int yycolumn;
	extern int yyleng;
%}


WHITESPACE		[ \t\v\f]
IDENTIFIER 		[a-zA-Z_]([a-zA-Z0-9_])*
NUMBER			([0-9]+|[0-9]+\.[0-9]+)
OPERATOR		[-+*/]|"=="|">="|"<="|">"|"<"
U_OPERATOR		"++"|"--"	
SINGLE_CHAR		[=(){};]

%%

\n 				{ yycolumn = 0; yylineno++; }
{SINGLE_CHAR}   { yycolumn++; return yytext[0]; }
{OPERATOR}		{ yycolumn += yyleng; return OP; }
{U_OPERATOR}	{ yycolumn += yyleng; return UNARY_OP; }
"if"            { yycolumn += 2; return IF; }
"for"           { yycolumn += 3; return FOR; }
"else"          { yycolumn += 4; return ELSE; }
{NUMBER}		{ yycolumn += yyleng; return NUM; }
{IDENTIFIER}	{ yycolumn += yyleng; return ID; }
{WHITESPACE}    { yycolumn += yyleng; }
.				{ yycolumn += 1; return yytext[0];}

%%
  
int yywrap() {  
	return -1;  
}
