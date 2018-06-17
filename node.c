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
        if(!strcmp(root->name, "identifier")) {
            char *str = (char*)malloc(30 * sizeof(char));
            strcpy(str,yytext);
            root->stringVal = str;
        }
        else if(!strcmp(root->name, "intVal")) {
            root->intVal = atoi(yytext);
        }
        else if(!strcmp(root->name, "floatVal")) {
            root->floatVal = atof(yytext);
        }
        else if(!strcmp(root->name, "charVal")) {
            root->charVal = yytext[1];
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

void Traverse(Node* node, int level) {
    if(node) {
        printf("\n");
        for(int i = 0; i < level; i++) {
            printf("  ");
        }
        if(node->line != -1) {
            printf("%s ", node->name);
            if(!strcmp(node->name, "identifier")) printf(":%s", node->stringVal);
            else if(!strcmp(node->name, "intVal")) printf(":%d", node->intVal);
            else if(!strcmp(node->name, "floatVal")) printf(":%f", node->floatVal);
            else if(!strcmp(node->name, "charVal")) printf(":%c", node->charVal);
            else printf("(%d)",node->line);
            Traverse(node->lchild, level + 1);
            Traverse(node->rchild, level);
        }
    }
}

void Free(Node* root) {
    if(root) {
        //printf("free: %s l: %d r: %d\n", root->name, root->lchild, root->rchild);
        Free(root->lchild);
        Free(root->rchild); 
        free(root);
    }
}

void yyerror(char * str, ...) {
    //printf("error\n");
    va_list ap;
    va_start(ap,str);
    fprintf(stderr,"%d:error:",yylineno);
    vfprintf(stderr,str,ap);
    fprintf(stderr,"\n");
}

int main () {
    yyparse();
    Traverse(root,1);
    Free(root);
}