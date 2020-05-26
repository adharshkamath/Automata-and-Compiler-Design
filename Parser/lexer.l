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

%%
[ \t\n\v\f]     {;}
[(){};]         {return yytext[0];}
"if"            {return IF;}
"for"           {return FOR;}
"else"          {return ELSE;}
[a-zA-Z0-9]+    {yylval.f=yytext; return EXPR;}
%%
  
int yywrap() 
{  
return -1;  
}
