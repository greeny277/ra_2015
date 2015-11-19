CC     = gcc
#CC     = icc
CFLAGS = -std=c99 -Wall -D_XOPEN_SOURCE=700
#INTEL_ASM = -masm=intel
#DEBUG  = -save-temps -g
OPT    = -O3 -march=native
#OPT    = -O3 -xHost
LDFLAGS= -lrt
RM     = rm -f

SOURCES = $(shell ls cache_simulator.c \
                  2> /dev/null)
OBJS    = $(SOURCES:%.c=%.o)

.PHONY: all clean

all: cache_simulator

clean:
	$(RM) cache_simulator *.o *.s *.i

distclean:
	$(RM) cache_simulator *.o *.s *.i *.jpg *.ppm


cache_simulator: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

.c.o:
	$(CC) -c $(CFLAGS) $(INTEL_ASM) $(DEBUG) $(OPT) $<

cache_simulator.o:        cache_simulator.c Makefile
