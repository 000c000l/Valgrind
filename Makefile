modify: executable
	./a.out <$(src) >$(dest)
executable: lex.yy.c
	g++ lex.yy.c
lex.yy.c: src/conf.l
	lex src/conf.l
clean:
	rm -rf lex.yy.c a.out test newTest