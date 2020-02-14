#include<stdio.h>
int main() {
    yyin = fopen("testing.c", "r");
    yylex();
}

// single line comment