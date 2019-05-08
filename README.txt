Filename: README.txt
CS 530, Spring 2019
Assignment #3: Statement Parser
Brendan Le Tourneau: cssc0414 / 819897930
Uses Flex and Bison to recognize valid statements from an input file
### FILE MANIFEST
exp.l

exp.y

makefile

README.txt

ex.Leonard.txt

ex.test.txt

### BNF FOR VALID STATEMENTS

<statement> ::= <assignment> \n | <expression> \n

<assignment> ::= <id> = <expression> ;

<expression> ::= <term>
			  |	 <expression> <operation> <term>

<term> ::= <id>
		|  ( <expression> <operation> <term> )

<id> ::= alpha *(char | digit)

<operation> ::= + | - | * | / | %



### COMPILE INSTRUCTIONS
Compile using the make command

### OPERATING INSTRUCTIONS
Use the exp executable.

./exp will run the parser on the file ex.txt

### DESIGN DECISIONS
I used Flex and Bison to parse the statements. It proved to be a powerful tool.

### Deficiencies
The error message doesn't specify what exactly is wrong, just what Bison expected to see. Because of this, a missing closing parentheses will not be reported expected, but an error will still be thrown.

### Lessons Learned
Flex and Bison are kinda weird, but actually pretty cool. This project introduced me to some useful tools.