	//Filename: exp.l
	//CS 530, Spring 2019
	//Assignment #3: Statement Parser
	//Brendan Le Tourneau: cssc0414 / 819897930

%{
  #include <stdio.h>
  using namespace std;

  #include "exp.tab.h"  // to get the token types from Bison

%}
%%

[a-zA-Z][a-zA-Z0-9]*    {yylval.print = strdup(yytext); return ID;}
;						{return EOL;}
[-+*/%]					{yylval.print = strdup(yytext); return OP;}
=						{return EQU;}
\(  					{return OPEN;}
\)						{return CLOSE;}
[0-9]					;
\n						{return NEWLINE;}
\r 						;
[[:space:]]				;
.						{ return BADSYMBOL; }
%%