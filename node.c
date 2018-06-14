#include "node.h"

Node *CreateAST(char* name, int num, ...) {
    va_list valist;
    Node *root = (Node *)malloc(sizeof(Node));
    Node *temp = (Node *)malloc(sizeof(Node));
    root->name = name;
    va_start(valist, num);
    if(num == 0) {
        int lineNum = va_arg(valist, int);
        root->line = lineNum;
        if(!strcmp(root->name, "Tidentifier")) {
            char *str = (char*)malloc(30 * sizeof(char));
            strcpy(str,yytext);
            root->stringVal = str;
        }
        else if(!strcmp(root->name, "TintVal")) {
            root->intVal = atoi(yytext);
        }
        else if(!strcmp(root->name, "TfloatVal")) {
            root->floatVal = atof(yytext);
        }
    }
    else if(num > 0) {
        temp = va_arg(valist, Node*);
        root->lchild = temp;
        root->line = root->lchild->line;
        if(num >= 2) {
            for(int i = 0; i < num - 1; i++) {
                temp->rchild = va_arg(valist,Node*);
                temp = temp->rchild;
            }
        }
    }
    return root;
}

void eval(Node* node, int level) {
    printf("\n");
    printf(">>>");
    if(node) {
        for(int i = 0; i < level; i++) {
            printf("  ");
        }
        if(node->line != -1) {
            printf("%s ", node->name);
            if(!strcmp(node->name, "Tidentifier"))
                printf(":%s", node->stringVal);
            else if(!strcmp(node->name, "TintVal"))
                printf(":%d", node->intVal);
            else if(!strcmp(node->name, "TfloatVal"))
                printf(":%f", node->floatVal);
            else printf("(%d)",node->line);
            eval(node->lchild, level + 1);
            eval(node->rchild, level);
        }
    }
}

void yyerror(char * str, ...) {
    /*va_list ap;
    va_start(ap,str);
    //fprintf(stderr,"%d:error:",yylineno);
    vfprintf(stderr,str,ap);
    fprintf(stderr,"\n");*/
}

int main () {
    yyparse();
    eval(root,1);
}