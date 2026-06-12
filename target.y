%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int yyerror(char *s);
int yyparse();
int yylex();

void gen(char *res, char *op1, char *op2, char op){
	printf("MOVE R0, %s\n",op1);
	
	switch(op){
		case '+': printf("ADD R0,%s\n",op2); break;
		case '-': printf("SUB R0,%s\n",op2); break;
		case '*': printf("MUL R0,%s\n",op2); break;
		case '/': printf("DIV R0,%s\n",op2); break;
	}
	printf("MOVE %s , R0\n\n",res);
}

%}

%union{
char *str;
}


%token <str> ID NUM
%token INT MAIN PRINTF RETURN STRING 

%%
START:
	INT MAIN '(' ')' '{' STMTS '}' {
	printf("\nValid program\n");
	}
	;

STMTS:
	STMTS STMT
	|
	;

STMT:
	ID '=' NUM ';'
	{
	printf("MOVE R0,%s\n",$3);
	printf("MOVE %s,R0\n\n",$1);
	}
	| ID '=' ID '+' ID ';'
	  {
	  gen($1, $3, $5, '+');
	  }
	| ID '=' ID '-' ID ';'
	  {
	  gen($1, $3, $5, '-');
	  }
	| ID '=' ID '*' ID ';'
	  {
	  gen($1, $3, $5, '*');
	  }
	| ID '=' ID '/' ID ';'
	  {
	  gen($1, $3, $5, '/');	
	  }
	| PRINTF '(' STRING ',' ID ')' ';'
	  {
	  printf("PRINT %s\n\n",$5);
	  }
	| RETURN NUM ';'
	;
%%

int main(){
	printf("Enter  Program :\n");
	yyparse();
	return 0;
}


int yyerror(char *s){
	printf("Invalid Input");
	return 0;
}
