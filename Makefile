LIBS = -lcurl
CC = g++

default: test_script
all: default

test_script.o: test_script.cpp
	$(CC) -c test_script.cpp -o $@

test_script: test_script.o
	$(CC) test_script.o $(LIBS) -o $@

clean:
	-rm -f test_script.o
	-rm -f test_script
