%{
#include<stdio.h>
#include "y.tab.h"
%}
verb is|am|was|were|be|being|been|do|does|did|will|would|should|can|could|have|has|had|go|play
adverb very|simply|gently|calmly|quitely
preposition to|from|above|behind|below|between
conjunction if|then|and|but|or
adjective their|my|your|his|her|its
pronoun I|you|he|she|they
noun [a-zA-Z]+
%%

{verb} {return VERB;}
{adverb} {return ADVERB;}
{preposition} {return PREPOSITION;}
{conjunction} {return CONJUNCTION;}
{adjective} {return ADJECTIVE;}
{pronoun} {return PRONOUN;}
{noun} {return NOUN;}
"\n" {return NL;}
%%
