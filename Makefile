#Usages
#make : compiles all .rs
#make clean : remove ALL binaries and .pdb

.PHONY : all clean

#Compiler
CP = rustc
CFLAGS =

#Linker
LD = rustc
LDFLAGS =

#Cleaner (can specify a dir in which bin would be created)
RM = rm -rvf

#Executable files retriving
SRCS := $(wildcard *.rs)
BINS := $(SRCS:%.rs=%)

all: clean $(BINS)

%: $(SRCS)
	$(LD) $(LDFLAGS) $<


clean:
	@echo "Cleaning up..."
	$(RM) *.pdb $(BINS)