cc = clang -fobjc-arc
target = cal
source = main.m myCal.m
run:
	$(cc) -o $(target) $(source)
	./$(target)
	./$(target) 10 2014
	./$(target) -m 10
	./$(target) 2014
clean:
	rm $(target)
