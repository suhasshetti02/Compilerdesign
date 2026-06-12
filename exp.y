%{
#include<stdio.h>
#include<stdlib.h>
%}

%token NUM
%left '+' '-'
%left '*' '/'

%%

S:E {printf("Results : %d\n\n",$1);}
 ;
 
E : E '+' E {$$ = $1 + $3;}
  | E '-' E {$$ = $1 - $3;}
  | E '*' E {$$ = $1 * $3;}
  | E '/' E {
  	if($3 == 0)
  		yyerror();
  	else 
  	  $$ = $1 / $3;}
  | '(' E ')' {$$ = $2;}
  | '-' E {$$ = -$2;}
  | NUM {$$ = $1;}
  ;
%%

int main(){
	printf("Enter expression:\n");
	yyparse();
	return 0;
}

int yyerror(){
	printf("Invalid Zero division error");
	exit(0);
}
 
