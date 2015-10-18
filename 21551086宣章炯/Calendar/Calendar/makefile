CC = clang -fobjc-arc -framework Foundation
TARGET = cal
SOURCE = main.m Calendar.m
run:
	$(CC) -o $(TARGET) $(SOURCE)
	./$(TARGET)
	./$(TARGET) 10 2014
	./$(TARGET) -m 10
	./$(TARGET) 2014
clean:
	rm $(TARGET)