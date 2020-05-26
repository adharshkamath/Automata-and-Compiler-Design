/*
ACD assignment - 2:
Write a parser to identify the following grammar:


stmts 🡪 stmts stmt 
| epsilon
stmt 🡪 ;
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
%}


/* 
IDENTIFIER is a C style identifier
Let TERM be IDENTIFIER or NUMBER

EXPRESSION matches the following types of patterns:
	TERM
	TERM OPERATOR TERM (With the whitespace being optional)
*/
WHITESPACE		[ \t\n\v\f]
IDENTIFIER 		[a-zA-Z_]([a-zA-Z0-9_])*
NUMBER			[0-9]+
OPERATOR		[-+*/<=>]|"++"|"--"
EXPRESSION		({IDENTIFIER}|{NUMBER})|({IDENTIFIER}({WHITESPACE}*)?({OPERATOR}({WHITESPACE}*)?({IDENTIFIER}|{NUMBER}))?)
SINGLE_CHAR		[(){};]

%%

{SINGLE_CHAR}   {return yytext[0];}
"if"            {return IF;}
"for"           {return FOR;}
"else"          {return ELSE;}
{EXPRESSION}    {yylval.f=yytext; return EXPR;}
{WHITESPACE}    {;}

%%
  
int yywrap() 
{  
return -1;  
}
