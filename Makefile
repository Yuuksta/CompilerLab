input: token.l grammer.y node.h
	bison -d grammer.y
	flex token.l
	gcc grammer.tab.c lex.yy.c node.c