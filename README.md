# Valgrind_modified
Valgrind is a programming tool for memory debugging, memory leak detection, and profiling.



Requirements:

  1.lex
  
  2.valgrind
  
  
How To Use:
  1. run make src="(main C file)" dest="(modified C file)".
  2. make the executable for modified C file.
  3. run valgrind --leak-check=yes executable arg1 arg2.
