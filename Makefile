CC = gcc

CFLAGS = -Wall -Wextra \
         -std=c99 \
         -O1 \
		 -L/usr/lib/x86_64-linux-gnu/hdf5/serial \
		 -I/usr/include/hdf5/ \
         -lhdf5 \
         -mavx512dq \
         -DUSE_SIMD=0 \

CPPFLAGS = -I./include

LDLIBS = -lm \
         -fuse-ld=gold \

LIB = libmatrix.a

SRCS+= $(wildcard ./src/*.c)
SRCS+= $(wildcard ./src/math/*.c)
SRCS+= $(wildcard ./src/utils/*.c)
SRCS+= $(wildcard ./src/math/min_max/*.c)

OBJS=$(SRCS:.c=.o)

all: library

library: $(LIB)
$(LIB): $(OBJS)
	ar csr $(LIB) $(OBJS)

main: main.o $(LIB)
	$(CC) $< -o $@ $(LIB) $(CFLAGS) $(LDLIBS)

clean:
	${RM} ${OBJS}  ${DEPS} ${TARGET} $(LIB) main main.o

list:
	@echo $(SRCS)
