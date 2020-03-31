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

%option yylineno
%option noyywrap

%{
#include<stdio.h>
#include"parser.tab.h"
#include<math.h>

int line = 0;
int identifiers = 0;
int numbers = 0;
int comments = 0;
%}


%%

"if"                                { return IF; }
"else"                              { return ELSE; }
"for"                               { return FOR; }
"'"."'"                             { return character_constant; }
[0-9]+                              { return integer_constant; }
[0-9]+"."[0-9]+                     { return float_constant; }
[a-zA-Z_][a-zA-Z_0-9]*              { return identifier; }
"//"(\\.|[^\n])*[\n]				;
[/][*]([^*]|[*]*[^*/])*[*]+[/]      ;
[ \t\n]								;


%%
