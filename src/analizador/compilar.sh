lex lexer.l
yacc parser.y -d
#gcc main.c ./analizador/*.c