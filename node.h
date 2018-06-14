#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
extern int yyline;
extern char* yytext;
void yyerror(char *str, ...);


typedef struct Node {
    char *name;
    int line;
    union {
        char *stringVal;
        int intVal;
        float floatVal;
    };
    struct Node* lchild;
    struct Node* rchild;
} Node;

Node *root;
Node *CreateAST(char* name, int num, ...);
void eval(Node* node, int level);
