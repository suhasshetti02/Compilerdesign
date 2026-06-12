%{
#include<stdio.h>
%}

KEYWORD int|float|if|else|while|for|return
ID [a-zA-Z_][a-zA-Z0-9]*
NUMBER [0-9]+
OP [+\-*/=]
SPEC [;,(){}]

%%
{KEYWORD} { printf("%s : Keyword\n",yytext);}
{ID} { printf("%s : Identifier\n",yytext);}
{NUMBER} { printf("%s : Number\n",yytext);}
{OP} { printf("%s : Operator\n",yytext);}
{SPEC} {printf("%s : Special Character\n",yytext);}
[ \t\n]+ ;
. {printf("%s : Unknown character\n",yytext);}
%%

int yywrap(){
	return 1;
}

int main(){
	printf("Enter source code:\n");
	yylex();
	return 0;	
}



