CC     = gcc
#CC     = icc
CFLAGS = -std=c99 -Wall -D_XOPEN_SOURCE=700 -masm=intel -save-temps
OPT    = -O0 -march=native
LDFLAGS= -lrt
RM     = rm -f

SOURCES = $(shell ls Jacobi.c JacobiVanilla.c \
                  2> /dev/null) 
OBJS    = $(SOURCES:%.c=%.o)

.PHONY: all clean

all: Jacobi

clean:
	$(RM) Jacobi *.o *.s *.i

Jacobi: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

.c.o:
	$(CC) -c $(CFLAGS) $(OPT) $<

Jacobi.o:        Jacobi.c Jacobi.h JacobiVanilla.h Makefile
JacobiVanilla.o: JacobiVanilla.c Jacobi.h JacobiVanilla.h Makefile
