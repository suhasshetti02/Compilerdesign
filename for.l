%{
#include "y.tab.h"

%}

ID [a-zA-Z_][a-zA-Z0-9_]*
NUM [0-9]+

%%
"for" {return FOR;}
"<=" {return LE;}
">=" {return GE;}
"==" {return EQ;}
"++" {return INC;}
"--" {return DEC;}
{ID} {return ID;}
{NUM} {return NUM;}
[ \t]\n]+ ;
. {return yytext[0];}

%%

int yywrap(){
return 1;
}
