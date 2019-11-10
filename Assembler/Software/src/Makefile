CC = gcc

assembler: main.o assembly.o preprocess.o extra.o
	$(CC) main.o assembly.o preprocess.o extra.o -o assembler

main.o: main.c
	$(CC) -c main.c

assembly.o: assembly.c assembly.h
	$(CC) -c assembly.c

preprocess.o: preprocess.c preprocess.h
	$(CC) -c preprocess.c

extra.o: extra.c extra.h
	$(CC) -c extra.c
clean:
	rm *.o
