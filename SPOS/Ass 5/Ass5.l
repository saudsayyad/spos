%{
%}
letter [A-Za-z]
digit [0-9]
identifier {letter}({letter}|{digit})*
number {digit}+(\.{digit}+)?
punctuation [, : ; \. # ( ) { } ]
operators ["+" | "-" | "*" | "/" | "%" "<" | ">"]
keyword "if"|"else"|"for"|"switch"|"do"|"while"|"int"|"void"
singlelinecomment "//".*
multilinecomment "/*".*"*/"
literal [\".*\"]
comment "//".*
headerfile ["#"]

%%

{keyword} {printf ("keyword %s is found \n",yytext);}
{identifier} {printf ("identifier %s is found \n",yytext);}
{literal} {printf ("literal %s is found \n",yytext);}
{comment} {printf ("comment %s is found \n",yytext);}
{headerfile} {printf ("headerfile %s is found \n",yytext);}
{multilinecomment} {printf ("multilinecomment %s is found \n",yytext);}
{operators} {printf ("operator %s is found \n",yytext);}
{punctuation} {printf ("punctuation %s is found \n",yytext);}
{number} {printf ("number %s is found \n",yytext);}

%%

int main(){
	yylex();
}

int yywrap(){
	return 1;
}





