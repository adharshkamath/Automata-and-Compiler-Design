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
int identifiers = 0;
int numbers = 0;
int comments = 0;
%}

PREPROCESSOR #(include<.*>|define.*|ifdef|endif|ifndef|if|else|undef)
STRING \"([^\"])*\"|\'([^\'])*\'
KEYWORD auto|const|default|enum|extern|register|sizeof|static|struct|typedef|union|volatile
CONTROL_STATEMENT break|continue|goto|else|switch|if|case|default|for|do|while|return
DATATYPE char|double|float|int|long|short|signed|unsigned|void
IDENTIFIER [a-zA-Z_]([a-zA-Z0-9_])*
INVALID_IDENTIFIER (^[0-9])|[^a-zA-Z0-9_]
NUMERICAL_CONSTANT [1-9][0-9]*(\.[0-9]+)?|0(\.[0-9]+)?
UNARY_OPERATOR (\+\+|\-\-)
OPERATOR (=|\+|\-|\/|\*|%)
COMPARISON >=|>|<|<=
BITWISE_OPERATOR &|~|\||\^
SINGLELINE_COMMENT \/\/.*
MULTILINE_COMMENT "/*"([^*]|\*+[^/])*\*+"/"
MALFORMED_STRING (\"[^"\n]*|\'[^'\n]*)
PARENTHESIS \(|\)|\[|\]|\{|\}
SEMICOLON ;
COMMA ,
DOT_DELIMITER \.

%option noyywrap

%%

\n line++;
[\t ] ;
{MULTILINE_COMMENT} {printf("%20s \t---- \tMULTILINE COMMENT\n", yytext); comments++;}
{DOT_DELIMITER} {printf("%20s \t---- \tDOT DELIMITER\n", yytext);}
{SEMICOLON} {printf("%20s \t---- \tSEMICOLON\n", yytext);}
{COMMA} {printf("%20s \t---- \tCOMMA\n", yytext);}
{PREPROCESSOR} {printf("%20s \t---- \tPREPROCESSOR\n", yytext);}
{MALFORMED_STRING} {printf("%20s \t---- \tMALFORMED STRING\n", yytext);}
{STRING} {printf("%20s \t---- \tSTRING\n", yytext);}
{KEYWORD} {printf("%20s \t---- \tKEYWORD\n", yytext);}
{CONTROL_STATEMENT} {printf("%20s \t---- \tCONTROL STATEMENT\n", yytext);}
{DATATYPE} {printf("%20s \t---- \tDATATYPE\n", yytext);}
{IDENTIFIER} {printf("%20s \t---- \tIDENTIFIER\n", yytext); identifiers++;}
{NUMERICAL_CONSTANT} {printf("%20s \t---- \tNUMERICAL CONSTANT\n", yytext); numbers++;}
{UNARY_OPERATOR} {printf("%20s \t---- \tUNARY OPERATOR\n", yytext);}
{OPERATOR} {printf("%20s \t---- \tOPERATOR\n", yytext);}
{SINGLELINE_COMMENT} {printf("%20s \t---- \tSINGLE LINE COMMENT\n", yytext); comments;}
{PARENTHESIS} {printf("%20s \t---- \tPARENTHESIS\n", yytext);}
{COMPARISON} {printf("%20s \t---- \tCOMPARISON OPERATOR\n", yytext);}
{BITWISE_OPERATOR} {printf("%20s \t---- \tBITWISE OPERATOR\n", yytext);}

%%

int main() {
    yyin = fopen("testing.c", "r");
    printf("%33s", "Starting Lexer");
    printf("\n---------------------------------------------------\n");
    printf("%20s    ----  \t %s", "Lexeme", "Token");
    printf("\n---------------------------------------------------\n");
    yylex();
    printf("\n-------------- Analyzed %d lines of code -------------\n\n", line+1);
    printf("\n------------------ Found %d variables -----------------\n\n", identifiers);
    printf("\n------------- Found %d numerical constants ------------\n\n", numbers);
    printf("\n------------------ Found %d comments ------------------\n\n", comments);
}