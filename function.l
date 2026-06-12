%{
#include "y.tab.h"
%}

ID      [a-zA-Z_][a-zA-Z0-9_]*
NUM     [0-9]+

%%

"int"       { return INT; }
"float"     { return FLOAT; }
"char"      { return CHAR; }
"void"      { return VOID; }
"return"      { return RETURN; }
{ID}        { return ID; }
{NUM}       { return NUM; }

[ \t\n]     ;

.           { return yytext[0]; }

%%

int yywrap()
{
    return 1;
}
