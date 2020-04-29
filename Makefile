newExcutable: modify
	gcc $(file1) -o $(file2) | gcc $(file3) -o $(file4)
modify: executable
	./a.out <$(file1) >$(file3)
executable: lex.yy.c
	g++ lex.yy.c
lex.yy.c: src/conf.l
	lex src/conf.l
clean:
	rm -rf lex.yy.c a.out test newTest