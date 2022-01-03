all: main

main: main.o game.o
	g++ -W -Wall -o main main.o game.o

main.o: main.cpp game.h
	g++ -c main.cpp

game.o: game.cpp game.h
	g++ -c game.cpp

.PHONY: clean
clean:
	rm game.o main.o