%{
#include <stdio.h>
//#include "definition.h"
#include "node.h"

%}

%union {
    Node *node;
}

%token <node> Tif Telse Twhile Treturn Tint Tfloat Tchar Tvoid
%token <node> Tidentifier TfloatVal TintVal Tassign TcmpEqual TcmpNotEqual TlessThan TlessThanEq
%token <node> TmoreThan TmoreThanEq TleftParen TrightParen TleftBrace Tsemi
%token <node> TrightBrace Tdot Tcomma Tplus Tminus Tmul Tdiv Tmod
%token <node> Tand Tor TselfMinus TselfInc

%type <node> Program DecList Declare VarDecl Type FuncDecl StmtBlock Stmt
%type <node> Expr IfStmt ElseStmt WhileStmt ReturnStmt StmtList

%left Tor Tand Tplus Tminus Tmul Tdiv TleftBrace TrightBrace TleftParen TrightParen Tdot

%%


Program: { root = CreateAST("Program",0,-1); }
    | DecList { root = CreateAST("Program",1,$1); }
    ;

DecList: { $$ = CreateAST("DecList",0,-1); }
    | Declare DecList { $$ = CreateAST("DecList",2,$1,$2); }
    ;

Declare: VarDecl { $$ = CreateAST("Declare",1,$1); }
    | FuncDecl { $$ = CreateAST("Declare",1,$1); }
    ;

VarDecl: Type Tidentifier { $$ = CreateAST("VarDecl",2,$1,$2); };

Type: Tint { $$ = CreateAST("Type",1,$1); }
    | Tchar { $$ = CreateAST("Type",1,$1); } 
    | Tfloat { $$ = CreateAST("Type",1,$1); }
    ;

FuncDecl: Type Tidentifier '(' VarDecl ')' StmtBlock { $$ = CreateAST("FuncDecl",4,$1,$2,$4,$6); }
    | Tvoid Tidentifier '(' VarDecl ')' StmtBlock { $$ = CreateAST("FuncDecl",4,$1,$2,$4,$6); }
    ;

StmtBlock: { $$ = CreateAST("StmtBlock",0,-1); } 
    | '{' StmtList '}' { $$ = CreateAST("StmtBlock",1,$2); }
    ;

StmtList: { $$ = CreateAST("StmtList",0,-1); }
    | Stmt StmtList { $$ = CreateAST("StmtList",2,$1,$2); }
    ;

Stmt: Expr { $$ = CreateAST("Stmt",1,$1); }
    | IfStmt { $$ = CreateAST("Stmt",1,$1); }
    | WhileStmt { $$ = CreateAST("Stmt",1,$1); }
    | ReturnStmt { $$ = CreateAST("Stmt",1,$1); }
    ;


IfStmt: Tif '(' Expr ')' Stmt ElseStmt { $$ = CreateAST("IfStmt",4,$1,$3,$5,$6); }
    | Tif '(' Expr ')' StmtBlock ElseStmt { $$ = CreateAST("IfStmt",4,$1,$3,$5,$6); }
    ;

ElseStmt: { $$ = CreateAST("ElseStmt",0,-1); }
    | Telse Stmt { $$ = CreateAST("ElseStmt",2,$1,$2); }
    | Telse StmtBlock { $$ = CreateAST("Stmt",2,$1,$2); }
    ;


WhileStmt: Twhile '(' Expr ')' Stmt { $$ = CreateAST("WhileStmt",3,$1,$3,$5); }
    | Twhile '(' Expr ')' StmtBlock { $$ = CreateAST("WhileStmt",3,$1,$3,$5); }
    ;

ReturnStmt: Treturn Expr { $$ = CreateAST("ReturnStmt",2,$1,$2); }
    ;

Expr: Expr Tassign Expr { $$ = CreateAST("Expr",3,$1,$2,$3); }
    | Expr Tplus Expr { $$ = CreateAST("Expr",3,$1,$2,$3); }
    | Expr Tminus Expr { $$ = CreateAST("Expr",3,$1,$2,$3); }
    | Expr Tmul Expr { $$ = CreateAST("Expr",3,$1,$2,$3); }
    | Expr Tdiv Expr { $$ = CreateAST("Expr",3,$1,$2,$3); }
    | Expr TselfInc { $$ = CreateAST("Expr",2,$1,$2); }
    | Expr TselfMinus { $$ = CreateAST("Expr",2,$1,$2); }
    | Expr TlessThan Expr { $$ = CreateAST("Expr",3,$1,$2,$3); }
    | Expr TlessThanEq Expr { $$ = CreateAST("Expr",3,$1,$2,$3); }
    | Expr TmoreThan Expr { $$ = CreateAST("Expr",3,$1,$2,$3); }
    | Expr TmoreThanEq Expr { $$ = CreateAST("Expr",3,$1,$2,$3); }
    | Expr Tmod Expr { $$ = CreateAST("Expr",3,$1,$2,$3); } 
    | Expr TcmpEqual Expr { $$ = CreateAST("Expr",3,$1,$2,$3); }
    | Expr TcmpNotEqual Expr { $$ = CreateAST("Expr",3,$1,$2,$3); }
    | '(' Expr ')' { $$ = CreateAST("Expr",1,$2); }
    ;

%%