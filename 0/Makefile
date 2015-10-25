CC     = gcc
CFLAGS = -std=c99 -Wall -D_XOPEN_SOURCE=700 -masm=intel -march=native -save-temps
OPT    = -O3
LDFLAGS=-lrt
RM     = rm -f

# If any of the files in the following list does not exist, the corresponding .o
# module is taken from the libraries libmother.a or libjbuffer.a, respectively.
SOURCES = $(shell ls Jacobi.c JacobiVanilla.c \
                  2> /dev/null) 
OBJS    = $(SOURCES:%.c=%.o)

.PHONY: all clean

all: Jacobi

clean:
	$(RM) Jacobi *.o

Jacobi: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

.c.o:
	$(CC) -c $(CFLAGS) $(OPT) $<

Jacobi.o:        Jacobi.c Jacobi.h JacobiVanilla.h Makefile
JacobiVanilla.o: JacobiVanilla.c Jacobi.h JacobiVanilla.h Makefile
