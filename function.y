%{
#include<stdio.h>
#include<stdlib.h>
int yyerror();
%}

%token INT FLOAT CHAR VOID RETURN
%token ID NUM

%%
Start : Function
	{
	 printf("Valid function definition\n");
	 return 0;
	 }
	 ;

Function : Type ID '(' Parameters ')' Block
	;
	
Type : INT | FLOAT | CHAR | VOID ;
	
Parameters : Parameter ',' Parameters
	|Parameter
	|
	;

Parameter : Type ID
	;
	
Block : '{' Statements '}'
	;
	
Statements : Statements Statement
	|
	;

Statement : ID ';'
	| ID '=' NUM ';'
	| RETURN ID '+' ID';'
	;
%%

int main()
{
    printf("Enter function definition (press Ctrl+D to evaluate):\n");
    yyparse();
    return 0;
}

int yyerror()
{
    printf("Invalid Function Definition\n");
    exit(0);
}
