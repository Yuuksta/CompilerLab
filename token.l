%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "node.h"
#include "grammer.tab.h"

//#include "parser.hpp"
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
"if"                          { TOKEN("Tif"); /*printf("if");*/ return Tif; }
"else"                        { TOKEN("Telse"); /*printf("else");*/ return Telse; }
"while"                       { TOKEN("Twhile"); /*printf("while");*/ return Twhile; }
"return"                      { TOKEN("Treturn"); /*printf("return");*/ return Treturn; }
"int"                         { TOKEN("Tint"); /*printf("int");*/ return Tint; }
"float"                       { TOKEN("Tfloat"); /*printf("float");*/ return Tfloat; }
"char"                        { TOKEN("Tchar"); /*printf("char");*/ return Tchar; }
"void"                        { TOKEN("Tvoid"); /*printf("void");*/ return Tvoid; }
[a-zA-Z_][a-zA-Z0-9_]*        { TOKEN("Tidentifier"); /*printf("identifier");*/ return Tidentifier; }
[0-9]+\.[0-9]*                { TOKEN("TfloatVal"); /*printf("floatValue");*/ return TfloatVal; }
[0-9]+                        { TOKEN("TintVal");/* printf("intValue");*/return TintVal; }
'.'                           { TOKEN("TcharVal"); return TcharVal; }
";"                           { TOKEN("Tsemi"); /*printf("; semi");*/ return Tsemi; }
"="                           { TOKEN("Tassign"); /*printf("= assign");*/ return Tassign; }
"=="                          { TOKEN("TcmpEqual"); /*printf("= cmpEqual");*/ return TcmpEqual; }
"!="                          { TOKEN("TcmpNotEqual"); /* cmpNotEqual");*/ return TcmpNotEqual; }
"<"                           { TOKEN("TlessThan"); /*printf("< lessThan");*/ return TlessThan; } 
"<="                          { TOKEN("TlessThanEq"); /*printf("<= lessThanEqual");*/ return TlessThanEq; }
">"                           { TOKEN("TmoreThan"); /*printf("> moreThan");*/ return TmoreThan; }
">="                          { TOKEN("TmoreThanEq"); /*printf(">= moreThanEqual");*/ return TmoreThanEq; }
"("                           { TOKEN("TleftParen"); /*printf(" leftParen");*/ return yytext[0]; } 
")"                           { TOKEN("TrightParen"); /*printf(" rightParen");*/ return yytext[0]; }
"{"                           { TOKEN("TleftBrace"); /*printf(" leftBrace");*/ return yytext[0]; }
"}"                           { TOKEN("TrightBrace"); /*printf(" rightBrace");*/ return yytext[0]; }
"."                           { TOKEN("Tdot"); /*printf(". dot");*/ return Tdot; }
","                           { TOKEN("Tcomma"); /*printf(", comma");*/ return Tcomma; }
"+"                           { TOKEN("Tplus"); /*printf("+ plus");*/ return Tplus; }
"-"                           { TOKEN("Tminus"); /*printf("- minus");*/ return Tminus; }
"*"                           { TOKEN("Tmul"); /*("* mul");*/ return Tmul; }
"/"                           { TOKEN("Tdiv"); /*printf("/ div");*/ return Tdiv; }
"%"                           { TOKEN("Tmod"); /*printf(" mod");*/ return Tmod; }
"&&"                          { TOKEN("Tand"); /*printf("&& and");*/ return Tand; }
"||"                          { TOKEN("Tor"); /*printf("|| or");*/ return Tor; }
"--"                          { TOKEN("TselfMinus"); /*printf("-- selfminus");*/ return TselfMinus; }
"++"                          { TOKEN("TselfInc"); /*printf("++ selfInc");*/ return TselfInc; }
"!"                           { TOKEN("Tnot"); return Tnot; }
.                             { TOKEN("Tunknow"); /*printf("Unknown token!\n");*/ yyterminate(); }

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