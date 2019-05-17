#########################################
# Created by Jean-Philippe Legault
#
# This is a comment, a comment always start with `#`
# Indentation is primordial in a Makefile.
# the steps for a target are always indented
#
##########################################

# compile with gcc, change this to clang if you prefer
COMPILER = gcc

# The C flags to pass to gcc
C_FLAGS = -Wall -Wextra -g

# prepend the command with '@' so that Make does not print the command before running it 
help:
	@printf "available command:\n"
	@printf "	make help               (this command)\n"
	@printf "	make ArraySort          (to build your C program)\n"
	@printf "	make test               (to run every test case)\n"

# link our .o files to make an executable
ArraySort: ArraySort.o
	$(COMPILER) $(C_FLAGS) -o ArraySort ArraySort.o 

# compile the `Stack.o` file
ArraySort.o: ArraySort.c
	$(COMPILER) $(C_FLAGS) -c ArraySort.c

##################################################################
# Test Cases
test: test1 test2 test3

# run our executable by passing in the text file via stdin with `<` and passing stdout to a file with `>`
# then use a scrit to verify that the result are the same one as the one expected
test1: ArraySort Data/test1.input Data/test1.expected
	./ArraySort < Data/test1.input > test1.result
	./TestPassed.sh test1.result Data/test1.expected

test2: ArraySort Data/test2.input Data/test2.expected
	./ArraySort < Data/test2.input > test2.result
	./TestPassed.sh test2.result Data/test2.expected

test3: ArraySort Data/test3.input Data/test3.expected
	./ArraySort < Data/test3.input > test3.result
	./TestPassed.sh test3.result Data/test3.expected
