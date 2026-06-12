%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
int count = 0;
%}

%token FOR ID NUM LE GE EQ DEC INC

%%
Start : For1
	{
	printf("\nNumber of for loops %d\n",count);
	}
	
      ;
      
For1 : FOR '(' Expr ';' Expr ';' Expr ')' '{' For2 '}'
		{
			count++;
		}
		;

For2 : FOR '(' Expr ';' Expr ';' Expr ')' '{' For3 '}'
		{
			count++;
		}
		;
For3 : FOR '(' Expr ';' Expr ';' Expr ')' '{' Block '}'
		{
			count++;
		}
		;

ForLoop : FOR '(' Expr ';' Expr ';' Expr ')' '{' Block '}'
		{
			count++;
		}
		;
Block : Statement Block
	|
	;
	
Statement : ForLoop
	|ID ';'
	;
	

Expr: ID '=' NUM |ID '<' NUM |ID '>' NUM |ID LE NUM |ID GE NUM | ID EQ NUM |ID INC |ID DEC ;
%%

int main(){
	printf("\nEnter the code\n");
	yyparse();
	return 0;
}

int yyerror(){
	printf("Loop is less then 3 levels\n");
	exit(0);
} 
