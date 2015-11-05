CC     = gcc
#CC     = icc
CFLAGS = -std=c99 -Wall -D_XOPEN_SOURCE=700 -masm=intel -save-temps
#OPT    = -O3 -xhost
LDFLAGS= -lrt
RM     = rm -f

SOURCES = $(shell ls vec_sum.c vec_sum_vanilla.c \
                  2> /dev/null) 
OBJS    = $(SOURCES:%.c=%.o)

.PHONY: all clean

all: vec_sum

clean:
	$(RM) vec_sum *.o *.s *.i

vec_sum: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

.c.o:
	$(CC) -c $(CFLAGS) $(OPT) $<

vec_sum.o:        vec_sum.c vec_sum.h vec_sum_vanilla.h Makefile
vec_sum_vanilla.o: vec_sum_vanilla.c vec_sum.h vec_sum_vanilla.h Makefile
