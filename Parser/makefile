frontend: lexer parser
	gcc lex.yy.c y.tab.c -o program

lexer: lexer.l
	lex lexer.l

parser: parser.y
	yacc -d parser.y -Wno-yacc