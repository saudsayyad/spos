%{
#include<stdlib.h>
#include<stdio.h>
int yylex();
int yyerror();
%}
%token VERB ADVERB PREPOSITION CONJUNCTION ADJECTIVE PRONOUN NOUN NL
%%


sentence : simple_sentence NL {printf("Simple sentence.\n");exit(0);}
	 | compound_sentence NL {printf("Compound sentence.\n");exit(0);}
	  ;
	  
simple_sentence : subject verb object
		 | subject verb object prep_phase
		 ;
compound_sentence : simple_sentence CONJUNCTION simple_sentence
		   | compound_sentence CONJUNCTION simple_sentence
		   ;
		   
subject : NOUN
	 | PRONOUN
	 | ADJECTIVE subject
	 ;
	 
verb : VERB
      | ADVERB VERB
      | verb VERB
      ;
      
object : NOUN
	| ADJECTIVE object
	;
	
prep_phase: PREPOSITION NOUN
	   ;
%%
int main()
{
	yyparse();
}
int yyerror()
{
printf("Invalid Statement");
}
int yywrap()
{
return 1;
}

