CFLAGS= -Wall -Wextra
INCFLAGS= -I include/
OBJPATH=obj/
LDFLAGS = -lncurses
CSTD = -std=c11
CC = gcc
EXEC = main
vpath %.c src/
vpath %.h include/
vpath %.o obj/


all: main

$(EXEC): $(addprefix $(OBJPATH),$(addsuffix .o,$(basename $(notdir $(wildcard src/*.c)))))
	$(CC) $(CSTD) $(CFLAGS) -o $@ $^ $(LDFLAGS) && rm -rf $(OBJPATH)

$(OBJPATH)%.o : %.c $(OBJPATH) 
	$(CC) $(CSTD) $(CFLAGS) $(INCFLAGS) -c -o $@ $<

debug: $(addprefix $(OBJPATH),$(addsuffix .o,$(basename $(notdir $(wildcard src/*.c)))))
	$(CC) $(CSTD) $(CFLAGS) -g -o $(EXEC) $^ $(LDFLAGS) && rm -rf $(OBJPATH)


$(OBJPATH):
	mkdir $@

clean: 
	rm -rf doc main vgcore.* $(OBJPATH) install_dir/
