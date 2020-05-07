# Valgrind_modified
Valgrind is a programming tool for memory debugging, memory leak detection, and profiling.



Requirements:

  1.lex
  
      sudo apt-get install bison flex
  
  2.valgrind
      
      Run following commands:
      
      1. Go to the src/valgrind-3.15.0
      
      2. Run "./configure" with the prefix(--prefix="where you want to install").
      
      3. Run "make".
      
      4. Run "make install"(Run it as root)
      
      5. Test your installation with "valgrind ls -l". If it bombs with the list of  complaints the contact us at cs17b017@iittp.ac.in
  
  
How To Install:
  1. run INSTALL
  
  2. Setting the environment variables:
    
    a. open .bashrc
    
    b. add "export VALGRIND_HOME='valgrind location' " to .bashrc
      
    c. add "source $VALGRIND_HOME/src/commands.sh;" to .bashrc
    
    d. then load the .bashrc by running "source .bashrc"
      
  3. Test valgrind_modified command from the terminal on one of the examples present:
      
      syntax:
            
          $ valgrind_modified input_file output_file
      

How To Use:
 
 1. First modify the input file by running:
        
        $ valgrind_modified input_file output_file
 
 2. Then compile it with gcc and get a executable.
 
 3. At last run:
 
        $ valgrind --leak-check=yes ./executable [arguments]
