#Filename: makefile
#CS 530, Spring 2019
#Assignment #3: Statement Parser
#Brendan Le Tourneau: cssc0414 / 819897930

bisonFile=exp.y
flexFile=exp.l
compArgs=exp.tab.c lex.yy.c -lfl -o exp
rmArgs=exp exp.tab* lex.yy.c

exp: exp.l exp.y
	bison -d $(bisonFile)
	flex $(flexFile)
	g++ $(compArgs)

clean:
	rm $(rmArgs)