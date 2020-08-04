all: first

first: first.c cache.o cache.h
	gcc -Wall -Werror -fsanitize=address -o first cache.o first.c

clean:
	rm -rf cache.o first
