CC = gcc

CFLAGS = -Wall -Wextra -Werror -pedantic -Wvla \
         -std=c99 \
         -O2 \
         -mavx512dq \

LDFLAGS =  -L/usr/lib/x86_64-linux-gnu/hdf5/serial \
		   -L./lib \
		   -fuse-ld=gold

CPPFLAGS = -I./include \
		 -I/usr/include/hdf5/serial \
         -DUSE_SIMD=0

LDLIBS = -lm \
         -lhdf5 \
		 -lmatrix

LIB = lib/libmatrix.a

VERBOSE :=

SRCS+= $(wildcard ./src/*.c)
SRCS+= $(wildcard ./src/math/*.c)
SRCS+= $(wildcard ./src/utils/*.c)
SRCS+= $(wildcard ./src/math/min_max/*.c)

OBJS=$(SRCS:.c=.o)

all: library 

library: $(LIB)

$(LIB): $(OBJS)
	@ar csr $(LIB) $(OBJS)

main: main.o $(LIB) print_flag
	@echo "Linking library ..." 
	@$(CC) main.o -o $@ $(LDLIBS) $(LDFLAGS)
	
%.o: %.c
	@echo "Compiling \033[38;5;222m$^\033[0m"
	$(VERBOSE)$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c -o $@ $<
	$(eval VERBOSE := @)

clean:
	@echo "Clean the project ..."
	@${RM} ${OBJS}  ${DEPS} ${TARGET} $(LIB) main main.o
	@echo "Project clean"

print_flag:
	@echo ""
	@echo "CFLGAS: \033[38;5;10m${CFLAGS}\033[0m"
	@echo "CPPFLAGS: \033[38;5;10m${CPPFLAGS}\033[0m"
	@echo "LDFLAGS: \033[38;5;10m${LDFLAGS}\033[0m"
	@echo "LDLIBS: \033[38;5;10m${LDLIBS}\033[0m"
	@echo ""

list:
	@echo $(SRCS)
