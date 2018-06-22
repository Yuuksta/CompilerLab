%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "node.h"
#include "grammer.tab.h"

//#define SAVE_TOKEN(t) yylval.a = CreateAST(t, 0, yylineno)
#define TOKEN(t) ( yylval.node = CreateAST(t,0,yylineno))

/*struct yylval {
    char name[200];
    double floatVal;
    int intVal;
} yylval;*/
%}
%option yylineno
%%

[ \t\n]                       ;
"if"                          { TOKEN("if"); /*printf("if");*/ return Tif; }
"else"                        { TOKEN("else"); /*printf("else");*/ return Telse; }
"while"                       { TOKEN("while"); /*printf("while");*/ return Twhile; }
"return"                      { TOKEN("return"); /*printf("return");*/ return Treturn; }
"int"                         { TOKEN("int"); /*printf("int");*/ return Tint; }
"float"                       { TOKEN("float"); /*printf("float");*/ return Tfloat; }
"char"                        { TOKEN("char"); /*printf("char");*/ return Tchar; }
"void"                        { TOKEN("void"); /*printf("void");*/ return Tvoid; }
[a-zA-Z_][a-zA-Z0-9_]*        { TOKEN("identifier"); /*printf("identifier");*/ return Tidentifier; }
[0-9]+\.[0-9]*                { TOKEN("floatVal"); /*printf("floatValue");*/ return TfloatVal; }
[0-9]+                        { TOKEN("intVal");/* printf("intValue");*/return TintVal; }
'.'                           { TOKEN("charVal"); return TcharVal; }
";"                           { TOKEN("semi"); /*printf("; semi");*/ return Tsemi; }
"="                           { TOKEN("assign"); /*printf("= assign");*/ return Tassign; }
"=="                          { TOKEN("cmpEqual"); /*printf("= cmpEqual");*/ return TcmpEqual; }
"!="                          { TOKEN("cmpNotEqual"); /* cmpNotEqual");*/ return TcmpNotEqual; }
"<"                           { TOKEN("lessThan"); /*printf("< lessThan");*/ return TlessThan; } 
"<="                          { TOKEN("lessThanEq"); /*printf("<= lessThanEqual");*/ return TlessThanEq; }
">"                           { TOKEN("moreThan"); /*printf("> moreThan");*/ return TmoreThan; }
">="                          { TOKEN("moreThanEq"); /*printf(">= moreThanEqual");*/ return TmoreThanEq; }
"("                           { TOKEN("leftParen"); /*printf(" leftParen");*/ return yytext[0]; } 
")"                           { TOKEN("rightParen"); /*printf(" rightParen");*/ return yytext[0]; }
"{"                           { TOKEN("leftBrace"); /*printf(" leftBrace");*/ return yytext[0]; }
"}"                           { TOKEN("rightBrace"); /*printf(" rightBrace");*/ return yytext[0]; }
"."                           { TOKEN("dot"); /*printf(". dot");*/ return Tdot; }
","                           { TOKEN("comma"); /*printf(", comma");*/ return yytext[0]; }
"+"                           { TOKEN("plus"); /*printf("+ plus");*/ return Tplus; }
"-"                           { TOKEN("minus"); /*printf("- minus");*/ return Tminus; }
"*"                           { TOKEN("mul"); /*("* mul");*/ return Tmul; }
"/"                           { TOKEN("div"); /*printf("/ div");*/ return Tdiv; }
"%"                           { TOKEN("mod"); /*printf(" mod");*/ return Tmod; }
"&&"                          { TOKEN("and"); /*printf("&& and");*/ return Tand; }
"||"                          { TOKEN("or"); /*printf("|| or");*/ return Tor; }
"--"                          { TOKEN("selfMinus"); /*printf("-- selfminus");*/ return TselfMinus; }
"++"                          { TOKEN("selfInc"); /*printf("++ selfInc");*/ return TselfInc; }
"!"                           { TOKEN("not"); return Tnot; }
.                             { TOKEN("unknow"); /*printf("Unknown token!\n");*/ yyterminate(); }

%%

int yywrap(void) {
    return 1;
}

/*int main (int args,  char **argv) {
    
    int tok;
    while(tok = yylex()) {
        if(tok == Tidentifier) printf(": %s\n", yylval.name);
        else if(tok == TfloatVal) printf(": %f\n", yylval.floatVal);
        else if(tok == TintVal) printf(": %d\n", yylval.intVal);
        else printf("\n");
    }
}*/