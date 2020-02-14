/*
ACD assignment - 1:
Write an lexical analyzer using lex/flex to identify tokens of a typical C program.
The program should be able to print series of token-ids for every lexical pattern that it recognizes.

Team Members:
Prajna N Hebbar - 181IT132
Adharsh Kamath - 181IT202
Sriram Rao - 181IT246
*/


PREPROCESSOR #(include<.*>|define.*|ifdef|endif|ifndef|if|else|undef)
STRING \"([^\"])*\"|\'([^\'])*\'
KEYWORD auto|const|extern|default|enum|return|switch|volatile|static|if|else|for|while|goto|do|int|char|float|double|case|continue|break|register
IDENTIFIER [a-zA-Z_]([a-zA-Z0-9_])*
NUMERICAL_CONSTANT [0-9]*
OPERATOR (\+\+|\-\-|=|\+|\-|\/|\*|%)
COMPARISON >=|>|<|<=
BITWISE_OPERATOR &|~|\||\^
SINGLELINE_COMMENT \/\/.*
PARENTHESIS \(|\)|\[|\]|\{|\}


%%

\n ;
[\t ] ;
; {printf("%s \t---- SEMICOLON\n", yytext);}
, {printf("%s \t---- COMMA\n", yytext);}
{PREPROCESSOR} {printf("%s \t---- PREPROCESSOR\n", yytext);}
{STRING} {printf("%s \t---- STRING\n", yytext);}
{KEYWORD} {printf("%s \t---- KEYWORD\n", yytext);}
{IDENTIFIER} {printf("%s \t---- IDENTIFIER\n", yytext);}
{NUMERICAL_CONSTANT} {printf("%s \t---- NUMERICAL_CONSTANT\n", yytext);}
{OPERATOR} {printf("%s \t---- OPERATOR\n", yytext);}
{SINGLELINE_COMMENT} {printf("%s \t---- SINGLELINE_COMMENT\n", yytext);}
{PARENTHESIS} {printf("%s \t---- PARENTHESIS\n", yytext);}
{COMPARISON} {printf("%s \t---- COMPARISON OPERATOR\n", yytext);}
{BITWISE_OPERATOR} {printf("%s \t---- BITWISE OPERATOR\n", yytext);}

%%


int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("testing.c", "r");
    yylex();
}