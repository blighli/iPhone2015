PROG = cal
SOURCES = cal.m
CFLAGS = -W -Wall -lobjc -framework Foundation -O2 -I.

all: $(PROG)

$(PROG): $(SOURCES)
	clang $(SOURCES) -o $@ $(CFLAGS)

clean:
	rm -rf $(PROG)
