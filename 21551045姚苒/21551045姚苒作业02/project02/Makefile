#Makefile
#make -f Makefile hello : -f指定执行的脚本文件名
#make -f Makefile : 默认执行脚本中第一个目标。

mycal : main.m
	clang -fno-objc-arc -framework foundation main.m -o mycal

#快捷执行指令
run :
	./mycal
	
clean :
	rm mycal