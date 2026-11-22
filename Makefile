CXX      = g++
CC       = gcc
CPPFLAGS = -Iinclude -MMD

main.exe: main.o add.o sub.o
	$(CXX) $^ -o $@

main.o: main.cpp
	$(CXX) $(CPPFLAGS) -c $< -o $@

add.o: add.cpp
	$(CXX) $(CPPFLAGS) -c $< -o $@

sub.o: sub.c
	$(CC) $(CPPFLAGS) -c $< -o $@

.PHONY: clean
clean:
	del main.exe main.o add.o sub.o main.d add.d sub.d

-include main.d add.d sub.d
