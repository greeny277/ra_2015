CC     = gcc
#CC     = icc
CFLAGS = -std=c99 -Wall -D_XOPEN_SOURCE=700
#INTEL_ASM = -masm=intel
#DEBUG  = -save-temps -g
OPT    = -O3 -march=native
#OPT    = -O3 -xHost
LDFLAGS= -lrt
RM     = rm -f

SOURCES = $(shell ls Jacobi.c JacobiVanilla.c \
                  2> /dev/null) 
OBJS    = $(SOURCES:%.c=%.o)

.PHONY: all clean

all: Jacobi

clean:
	$(RM) Jacobi *.o *.s *.i

distclean:
	$(RM) Jacobi *.o *.s *.i *.jpg *.ppm


Jacobi: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

.c.o:
	$(CC) -c $(CFLAGS) $(INTEL_ASM) $(DEBUG) $(OPT) $<

Jacobi.o:        Jacobi.c Jacobi.h JacobiVanilla.h Makefile
JacobiVanilla.o: JacobiVanilla.c Jacobi.h JacobiVanilla.h Makefile
