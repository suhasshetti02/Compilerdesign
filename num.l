%{
#include<stdio.h>
int pos_int = 0;
int neg_int = 0;
int pos_frac = 0;
int neg_frac = 0;
%}

DIGIT [0-9]

POS_INT \+?{DIGIT}+
NEG_INT -{DIGIT}+

POS_DEC \+?({DIGIT}+\.{DIGIT}*|\.{DIGIT}+)
NEG_DEC -({DIGIT}+\.{DIGIT}*|\.{DIGIT}+)

POS_FRAC1 \+?{DIGIT}+\/{DIGIT}+
NEG_FRAC1 -{DIGIT}+\/{DIGIT}+
NEG_FRAC2 {DIGIT}+\/-{DIGIT}+
POS_FRAC2 -{DIGIT}+\/-{DIGIT}+

%%
{NEG_DEC} {neg_frac++;}
{NEG_FRAC1} {neg_frac++;}
{NEG_FRAC2} {neg_frac++;}

{POS_DEC} {pos_frac++;}
{POS_FRAC1} {pos_frac++;}
{POS_FRAC2} {pos_frac++;}

{POS_INT} {pos_int++;}
{NEG_INT} {neg_int++;}

[ \t\n] ;
. ;

%%

int yywrap(){
return 1;
}

int main(){
printf("Enter input (press Ctrl+D to stop):\n");
    yylex();

    printf("\nPositive Integers: %d\n", pos_int);
    printf("Negative Integers: %d\n", neg_int);
    printf("Positive Fractions: %d\n", pos_frac);
    printf("Negative Fractions: %d\n", neg_frac);

    return 0;
 }


