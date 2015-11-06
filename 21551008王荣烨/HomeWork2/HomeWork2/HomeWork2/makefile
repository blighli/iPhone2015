CC=clang

FRAMEWORKS:=-framework Foundation
LIBRARIES:=-lobjc

SOURCE=main.m Calendar.m

CFLAGS=-Wall -Werror -g -v $(SOURCE)
LDFLAGS=$(LIBRARIES) $(FRAMEWORKS)
OUT=-o calendar

all:
$(CC) $(CFLAGS) $(LDFLAGS) $(OUT)
clean:
rm calendar
rm -rf calendar.*