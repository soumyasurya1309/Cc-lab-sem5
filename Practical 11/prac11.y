%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror(const char *s);
%}

%token ID KEY COMMA SEMI

%%
expr:
    KEY variable SEMI
    {
        printf("Valid declaration.\n");
    }
    ;

variable:
    ID
    | variable COMMA ID
    ;
%%

int main(void)
{
    printf("Enter a declaration: ");
    yyparse();
    return 0;
}

int yyerror(const char *s)
{
    printf("Invalid declaration.\n");
    return 0;
}