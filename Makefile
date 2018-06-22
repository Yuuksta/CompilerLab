input: token.l grammer.y node.h
	bison -d -v grammer.y
	flex token.l
	gcc grammer.tab.c lex.yy.c node.c -lfl -ly -o parser