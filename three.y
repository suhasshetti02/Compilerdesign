%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int temp = 1;
int tripleNo = 0;

char tac[100][100];
char quad[100][100];
char triple[100][100];

int t = 0, q = 0, tr = 0;

char *newTemp()
{
    char *s = malloc(10);
    sprintf(s,"t%d",temp++);
    return s;
}

char *generate(char *a1,char op,char *a2)
{
    char *res = newTemp();
    char line[100];

    /* Three Address Code */
    sprintf(line,"%s = %s %c %s",res,a1,op,a2);
    strcpy(tac[t++],line);

    /* Quadruple */
    sprintf(line,"(%c , %s , %s , %s)",op,a1,a2,res);
    strcpy(quad[q++],line);

    /* Triple */
    sprintf(line,"%d : (%c , %s , %s)",tripleNo++,op,a1,a2);
    strcpy(triple[tr++],line);

    return res;
}

int yyerror();
%}

%union{
    char *str;
}

%token <str> ID NUM
%type <str> E

%left '+' '-'
%left '*' '/'

%%

S : ID '=' E
{
    int i;

    printf("\nThree Address Code\n");
    for(i=0;i<t;i++)
        printf("%s\n",tac[i]);

    printf("%s = %s\n",$1,$3);

    printf("\nQuadruples\n");
    for(i=0;i<q;i++)
        printf("%s\n",quad[i]);

    printf("(= , %s , - , %s)\n",$3,$1);

    printf("\nTriples\n");
    for(i=0;i<tr;i++)
        printf("%s\n",triple[i]);

    printf("%d : (= , %s , %s)\n",tripleNo,$3,$1);
}
;

E : E '+' E { $$ = generate($1,'+',$3); }
  | E '-' E { $$ = generate($1,'-',$3); }
  | E '*' E { $$ = generate($1,'*',$3); }
  | E '/' E { $$ = generate($1,'/',$3); }
  | '(' E ')' { $$ = $2; }
  | ID { $$ = $1; }
  | NUM { $$ = $1; }
  ;

%%

int main()
{
    printf("Enter expression:\n");
    yyparse();
    return 0;
}

int yyerror()
{
    printf("Invalid Expression\n");
    return 0;
}
