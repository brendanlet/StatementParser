//Filename: exp.y
//CS 530, Spring 2019
//Assignment #3: Statement Parser
//Brendan Le Tourneau: cssc0414 / 819897930

%{
  #include <stdio.h>
  using namespace std;

  // Declaring stuff from Flex that Bison needs to know about:
  extern int yylex();
  extern int yyparse();
  extern FILE *yyin;
 
  void yyerror(const char *s);

%}

%error-verbose //Makes errors actually useful

%union{
	
	char *print; //For tokens that need to be printed

}

//Token declarations

%token EQU
%token <print> ID
%token EOL
%token <print> OP
%token OPEN
%token CLOSE
%token NEWLINE
%token BADSYMBOL


%%


//All the lines of the input file, essentially the structure of the file.
lines: line
	|	lines line
;

//Either an assignment, expression, newline, or error
line: ass NEWLINE {printf(" VALID\n");}
	|	exp NEWLINE {printf(" VALID\n");}
	|	error NEWLINE {yyerrok;}
	|	NEWLINE
;

//Assignment, such as "first = second + third ;"
ass: ID {printf($1);} EQU {printf(" = "); } exp EOL {printf(";");}
;

//Expression, either as part of an assignment or as a statement on its own
exp: term
	|	exp op term 
;

//An id or an entire parenthetical
term: id 
	|	OPEN {printf("(");} exp op term CLOSE {printf(")");}
;

//Used to print whichever ID flex returns when bison sees one
id: ID {printf($1);}
;

//Used to print whichever operator flex returns when bison sees one
op: OP {printf(" ");printf($1);printf(" "); }
;


%%

int main(int, char**) {
  // Open a file handle to a particular file:
  FILE *myfile = fopen("ex.txt", "r");
  // Set Flex to read from it instead of defaulting to STDIN:
  yyin = myfile;
  
  // Parse through the input:
  yyparse();
  
}

void yyerror(const char *s) {
    printf(" ");
    printf(s);
    printf("\n");
}



