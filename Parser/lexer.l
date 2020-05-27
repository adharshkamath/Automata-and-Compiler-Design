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
%}


WHITESPACE		[ \t\n\v\f]
IDENTIFIER 		[a-zA-Z_]([a-zA-Z0-9_])*
NUMBER			([0-9]+|[0-9]+\.[0-9]+)
OPERATOR		[-+*/]|"=="|">="|"<="|">"|"<"
U_OPERATOR		"++"|"--"	
SINGLE_CHAR		[=(){};]

%%

{SINGLE_CHAR}   {return yytext[0];}
{OPERATOR}		{return OP;}
{U_OPERATOR}	{return UNARY_OP;}
"if"            {return IF;}
"for"           {return FOR;}
"else"          {return ELSE;}
{NUMBER}		{return NUM;}
{IDENTIFIER}	{return ID;}
{WHITESPACE}    {;}

%%
  
int yywrap() 
{  
return -1;  
}
