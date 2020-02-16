/*
ACD assignment - 1:
Write an lexical analyzer using lex/flex to identify tokens of a typical C program.
The program should be able to print series of token-ids for every lexical pattern that it recognizes.

Team Members:
Prajna N Hebbar - 181IT132
Adharsh Kamath - 181IT202
Sriram Rao - 181IT246
*/

%{
int line = 0;
%}

PREPROCESSOR #(include<.*>|define.*|ifdef|endif|ifndef|if|else|undef)
STRING \"([^\"])*\"|\'([^\'])*\'
KEYWORD auto|const|double|float|int|short|struct|unsigned|break|continue|else|for|long|signed|switch|void|case|default|enum|goto|register|sizeof|typedef|volatile|char|do|extern|if|return|static|union|while
IDENTIFIER [a-zA-Z_]([a-zA-Z0-9_])*
NUMERICAL_CONSTANT [0-9]*
UNARY_OPERATOR (\+\+|\-\-)
OPERATOR (=|\+|\-|\/|\*|%)
COMPARISON >=|>|<|<=
BITWISE_OPERATOR &|~|\||\^
SINGLELINE_COMMENT \/\/.*
MALFORMED_STRING (\"[^"\n]*|\'[^'\n]*)
PARENTHESIS \(|\)|\[|\]|\{|\}
SEMICOLON ;
COMMA ,
DOT_DELIMITER \.


%%

\n line++;
[\t ] ;
{DOT_DELIMITER} {printf("%20s \t---- \tDOT DELIMITER\n", yytext);}
{SEMICOLON} {printf("%20s \t---- \tSEMICOLON\n", yytext);}
{COMMA} {printf("%20s \t---- \tCOMMA\n", yytext);}
{PREPROCESSOR} {printf("%20s \t---- \tPREPROCESSOR\n", yytext);}
{STRING} {printf("%20s \t---- \tSTRING\n", yytext);}
{KEYWORD} {printf("%20s \t---- \tKEYWORD\n", yytext);}
{IDENTIFIER} {printf("%20s \t---- \tIDENTIFIER\n", yytext);}
{NUMERICAL_CONSTANT} {printf("%20s \t---- \tNUMERICAL CONSTANT\n", yytext);}
{UNARY_OPERATOR} {printf("%20s \t---- \tUNARY OPERATOR\n", yytext);}
{OPERATOR} {printf("%20s \t---- \tOPERATOR\n", yytext);}
{SINGLELINE_COMMENT} {printf("%20s \t---- \tSINGLE LINE COMMENT\n", yytext);}
{PARENTHESIS} {printf("%20s \t---- \tPARENTHESIS\n", yytext);}
{COMPARISON} {printf("%20s \t---- \tCOMPARISON OPERATOR\n", yytext);}
{BITWISE_OPERATOR} {printf("%20s \t---- \tBITWISE OPERATOR\n", yytext);}

%%


int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("testing.c", "r");
    printf("%33s", "Starting Lexer");
    printf("\n---------------------------------------------------\n");
    printf("%20s    ----  \t %s", "Lexeme", "Token");
    printf("\n---------------------------------------------------\n");
    yylex();
    printf("\n-------------- Analyzed %d lines of code -------------\n\n", line+1);
}